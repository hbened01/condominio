<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CdPropietarios;

/**
 * CdPropietariosSearch represents the model behind the search form about `backend\models\CdPropietarios`.
 */
class CdPropietariosSearch extends CdPropietarios
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_propietarios_pk', 'cod_conjunto', 'cod_edificio', 'nro_piso'], 'integer'],
            [['nombre', 'apellido', 'fax', 'quien_vive', 'direccion', 'direccion_cobro'], 'safe'],
            [['telf_local', 'telf_celular', 'alicuota'], 'number'],
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
        $query = CdPropietarios::find();

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
            'cd_propietarios_pk' => $this->cd_propietarios_pk,
            'cod_conjunto' => $this->cod_conjunto,
            'cod_edificio' => $this->cod_edificio,
            'nro_piso' => $this->nro_piso,
            'telf_local' => $this->telf_local,
            'telf_celular' => $this->telf_celular,
            'alicuota' => $this->alicuota,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'fax', $this->fax])
            ->andFilterWhere(['like', 'quien_vive', $this->quien_vive])
            ->andFilterWhere(['like', 'direccion', $this->direccion])
            ->andFilterWhere(['like', 'direccion_cobro', $this->direccion_cobro]);

        return $dataProvider;
    }
}
