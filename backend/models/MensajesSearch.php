<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Mensajes;

/**
 * MensajesSearch represents the model behind the search form about `backend\models\Mensajes`.
 */
class MensajesSearch extends Mensajes
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_mensajes_pk'], 'integer'],
            [['texto'], 'safe'],
            [['msn_default'], 'boolean'],
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
        $query = Mensajes::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'cd_mensajes_pk' => $this->cd_mensajes_pk,
            'msn_default' => $this->msn_default,
        ]);

        $query->andFilterWhere(['like', 'LOWER(texto)', strtolower($this->texto)]);

        return $dataProvider;
    }
}
