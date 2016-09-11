<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CdConceptos;

/**
 * CdConceptosSearch represents the model behind the search form about `backend\models\CdConceptos`.
 */
class CdConceptosSearch extends CdConceptos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_conceptos_pk', 'frecuencia'], 'integer'],
            [['descrip_concepto', 'tipo'], 'safe'],
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
        $query = CdConceptos::find();

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
            'cd_conceptos_pk' => $this->cd_conceptos_pk,
            'frecuencia' => $this->frecuencia,
        ]);

        $query->andFilterWhere(['like', 'LOWER(descrip_concepto)', strtolower($this->descrip_concepto)])
            ->andFilterWhere(['like', 'LOWER(tipo)', strtolower($this->tipo)]);

        return $dataProvider;
    }
}
