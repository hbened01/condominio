<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CdPagos;

/**
 * CdPagosSearch represents the model behind the search form about `backend\models\CdPagos`.
 */
class CdPagosSearch extends CdPagos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_pago_pk', 'cod_factura', 'cod_tipo_pago', 'cod_tipo_doc'], 'integer'],
            [['nro_referencia', 'nro_cedula'], 'number'],
            [['fecha_pago', 'nota_pago', 'nombre', 'apellido', 'email'], 'safe'],
            [['estatus_pago'], 'boolean'],
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
        $query = CdPagos::find();
        $query->joinWith('codFactura');

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
            'cd_pago_pk' => $this->cd_pago_pk,
            'facturas.nr' => $this->cod_factura,
            'cod_tipo_pago' => $this->cod_tipo_pago,
            'nro_referencia' => $this->nro_referencia,
            'fecha_pago' => $this->fecha_pago,
            'nro_cedula' => $this->nro_cedula,
            'cod_tipo_doc' => $this->cod_tipo_doc,
            'estatus_pago' => $this->estatus_pago,
        ]);

        $query->andFilterWhere(['like', 'nota_pago', $this->nota_pago])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }
}
