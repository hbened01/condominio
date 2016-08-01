<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Facturas;

/**
 * FacturasSearch represents the model behind the search form about `backend\models\Facturas`.
 */
class FacturasSearch extends Facturas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_factura_pk', 'recibos'], 'integer'],
            [['cod_apto', 'edificio', 'nombre', 'apellido', 'fecha'], 'safe'],
            [['alicuota', 'nr', 'total_gastos_mes', 'sub_total_alicuota', 'total_pagar_mes', 'deuda_actual'], 'number'],
            [['estatus_factura'], 'boolean'],
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
        $query = Facturas::find();

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
            'cd_factura_pk' => $this->cd_factura_pk,
            'alicuota' => $this->alicuota,
            'nr' => $this->nr,
            'total_gastos_mes' => $this->total_gastos_mes,
            'sub_total_alicuota' => $this->sub_total_alicuota,
            'total_pagar_mes' => $this->total_pagar_mes,
            'deuda_actual' => $this->deuda_actual,
            'recibos' => $this->recibos,
            'estatus_factura' => $this->estatus_factura,
        ]);

        $query->andFilterWhere(['like', 'cod_apto', $this->cod_apto])
            ->andFilterWhere(['like', 'edificio', $this->edificio])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'fecha', $this->fecha]);

        return $dataProvider;
    }
}
