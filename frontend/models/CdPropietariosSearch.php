<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\CdPropietarios;

/**
 * CdPropietariosSearch represents the model behind the search form about `frontend\models\CdPropietarios`.
 */
class CdPropietariosSearch extends CdPropietarios
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_propietarios_pk', 'cod_user'], 'integer'],
            [['nro_piso', 'nombre', 'apellido', 'telf_local', 'telf_celular', 'email', 'quien_vive', 'direccion', 'direccion_cobro'], 'safe'],
            [['nro_cedula', 'alicuota'], 'number'],
            [['update_usr'], 'boolean'],
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
            'cod_user' => $this->cod_user,
            'nro_cedula' => $this->nro_cedula,
            'alicuota' => $this->alicuota,
            'update_usr' => $this->update_usr,
        ]);

        $query->andFilterWhere(['like', 'nro_piso', $this->nro_piso])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'telf_local', $this->telf_local])
            ->andFilterWhere(['like', 'telf_celular', $this->telf_celular])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'quien_vive', $this->quien_vive])
            ->andFilterWhere(['like', 'direccion', $this->direccion])
            ->andFilterWhere(['like', 'direccion_cobro', $this->direccion_cobro]);

        return $dataProvider;
    }
}
