<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Facturas;

/**
 * FacturasSearch represents the model behind the search form about `frontend\models\Facturas`.
 */
class FacturasSearch extends Facturas
{
    public $status_bill;
    const STATUS_0 = 0; // NO CANCELADA
    const STATUS_1 = 1; // TOTALMENTE CANCELADA
    const STATUS_2 = 2; // PARCIALMENTE CANCELADA
    const STATUS_3 = 3; // TODAS
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_factura_pk', 'recibos'], 'integer'],
            [['cod_apto', 'edificio', 'nombre', 'apellido', 'fecha'], 'safe'],
            [['alicuota', 'nr', 'total_gastos_mes', 'sub_total_alicuota', 'total_pagar_mes', 'deuda_actual', 'total_deducible'], 'number'],
            [['estatus_factura'], 'boolean'],
            ['status_bill', 'default', 'value' => self::STATUS_3],
            ['status_bill', 'in', 'range' => [self::STATUS_0, self::STATUS_1, self::STATUS_2, self::STATUS_3]],
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

        $query->select(['d.*'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
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

        if ($this->status_bill == 2) {
            $query->andFilterWhere([
                'and','d.estatus_factura = true', 'd.total_deducible <> 0'
            ]);
        } 
        else if ($this->status_bill == 1) {
            $query->andFilterWhere([
                'and','d.estatus_factura = true', 'd.total_deducible = 0'
            ]);
        }
        else if ($this->status_bill == 0) {
            $query->andFilterWhere([
                'and','d.estatus_factura = false'
            ]);
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
            'total_deducible' => $this->total_deducible,
        ]);

        $query->andFilterWhere(['like', 'LOWER(cod_apto)', strtolower($this->cod_apto)])
            ->andFilterWhere(['like', 'LOWER(edificio)', strtolower($this->edificio)])
            ->andFilterWhere(['like', 'LOWER(nombre)', strtolower($this->nombre)])
            ->andFilterWhere(['like', 'LOWER(apellido)', strtolower($this->apellido)])
            ->andFilterWhere(['like', 'LOWER(fecha)', strtolower($this->fecha)]);

        return $dataProvider;
    }
}
