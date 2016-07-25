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
            [['cd_pago_pk', 'cod_edificio', 'cod_apto', 'cod_tipo_pago', 'cod_tipo_doc'], 'integer'],
            [['nro_transferencia_referencia', 'nro_cedula'], 'number'],
            [['fecha_pago', 'nota_descrip_pago', 'nombre', 'apellido', 'email'], 'safe'],
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
            'cod_edificio' => $this->cod_edificio,
            'cod_apto' => $this->cod_apto,
            'cod_tipo_pago' => $this->cod_tipo_pago,
            'nro_transferencia_referencia' => $this->nro_transferencia_referencia,
            'fecha_pago' => $this->fecha_pago,
            'nro_cedula' => $this->nro_cedula,
            'cod_tipo_doc' => $this->cod_tipo_doc,
        ]);

        $query->andFilterWhere(['like', 'nota_descrip_pago', $this->nota_descrip_pago])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }
}
