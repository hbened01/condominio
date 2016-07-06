<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CdAptos;

/**
 * CdAptosSearch represents the model behind the search form about `backend\models\CdAptos`.
 */
class CdAptosSearch extends CdAptos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_aptos_pk'], 'safe'],
            [['cod_propietario', 'cod_edificio'], 'integer'],
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
        $query = CdAptos::find();

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
            'cod_propietario' => $this->cod_propietario,
            'cod_edificio' => $this->cod_edificio,
        ]);

        $query->andFilterWhere(['like', 'cd_aptos_pk', $this->cd_aptos_pk]);

        return $dataProvider;
    }
}
