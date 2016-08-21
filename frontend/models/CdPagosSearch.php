<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\CdPagos;

/**
 * CdPagosSearch represents the model behind the search form about `frontend\models\CdPagos`.
 */
class CdPagosSearch extends CdPagos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_pago_pk', 'cod_tipo_pago', 'cod_tipo_doc', 'cod_banco'], 'integer'],
            [['nro_referencia', 'nro_cedula', 'monto'], 'number'],
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


        $query->select(['f.*'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('facturas_pagos e','e.cod_facturas_fk = d.cd_factura_pk')
                        ->innerJoin('cd_pagos f','f.cd_pago_pk = e.cod_pagos_fk')
                        ->where (['b.id' => Yii::$app->user->identity->id]);

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
            'cod_tipo_pago' => $this->cod_tipo_pago,
            'nro_referencia' => $this->nro_referencia,
            'fecha_pago' => $this->fecha_pago,
            'nro_cedula' => $this->nro_cedula,
            'cod_tipo_doc' => $this->cod_tipo_doc,
            'estatus_pago' => $this->estatus_pago,
            'monto' => $this->monto,
            'cod_banco' => $this->cod_banco,
        ]);

        $query->andFilterWhere(['like', 'nota_pago', $this->nota_pago])
            ->andFilterWhere(['like', 'LOWER(nombre)', strtolower($this->nombre)])
            ->andFilterWhere(['like', 'LOWER(apellido)', strtolower($this->apellido)])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }
}
