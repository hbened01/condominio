<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\User;

/**
 * UserSearch represents the model behind the search form about `common\models\User`.
 */
class UserSearch extends User
{
    public $rol;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['id', 'status', 'created_at', 'updated_at', 'rol_id'], 'integer'],
            [['id'], 'integer'],
            //[['username', 'auth_key', 'password_hash', 'password_reset_token', 'email'], 'safe'],
            [['username', 'email','rol'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = User::find();

        if(Yii::$app->user->identity->rol_id != 1 && $id = 1){
            $query->joinWith(['roles'])->where('roles.id != 1');
        }else{
            $query->joinWith(['roles']);
        }

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

         $dataProvider->sort->attributes['rol'] = [
            'asc' => ['roles.nombre' => SORT_ASC],
            'desc' => ['roles.nombre' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'user.id' => $this->id,
            //'status' => $this->status,
            //'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
            // 'rol_id' => $this->rol_id,
        ]);

        $query->andFilterWhere(['like', 'LOWER(username)', strtolower($this->username)])
            ->andFilterWhere(['like', 'LOWER(email)', strtolower($this->email)])
            ->andFilterWhere(['like', 'LOWER(roles.nombre)', strtolower($this->rol)]);
            // ->andFilterWhere(['like', 'user.username', $this->username])
            //->andFilterWhere(['like', 'auth_key', $this->auth_key])
            // ->andFilterWhere(['like', 'password_hash', $this->password_hash])
            // ->andFilterWhere(['like', 'password_reset_token', $this->password_reset_token])
            // ->andFilterWhere(['like', 'user.email', $this->email])
            // ->andFilterWhere(['like', 'roles.nombre', $this->rol]);

        return $dataProvider;
    }
}
