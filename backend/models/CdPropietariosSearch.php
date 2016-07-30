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
    public $usuario;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_propietarios_pk', 'cod_user'], 'integer'],
            [['nro_piso', 'nombre','usuario', 'apellido', 'telf_local', 'telf_celular', 'email', 'quien_vive', 'direccion', 'direccion_cobro'], 'safe'],
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

        $query->joinWith(['user']);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['usuario'] = [
            'asc' => ['user.username' => SORT_ASC],
            'desc' => ['user.username' => SORT_DESC],
        ];


        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'cd_propietarios.cd_propietarios_pk' => $this->cd_propietarios_pk,
            'cd_propietarios.nro_cedula' => $this->nro_cedula,
            'cd_propietarios.alicuota' => $this->alicuota,
        ]);

        $query->andFilterWhere(['like', 'cd_propietarios.nro_piso', $this->nro_piso])
            ->andFilterWhere(['like', 'cd_propietarios.nombre', $this->nombre])
            ->andFilterWhere(['like', 'cd_propietarios.apellido', $this->apellido])
            // ->andFilterWhere(['like', 'telf_local', $this->telf_local])
            // ->andFilterWhere(['like', 'telf_celular', $this->telf_celular])
            ->andFilterWhere(['like', 'cd_propietarios.email', $this->email])
            // ->andFilterWhere(['like', 'quien_vive', $this->quien_vive])
            // ->andFilterWhere(['like', 'direccion', $this->direccion])
            // ->andFilterWhere(['like', 'direccion_cobro', $this->direccion_cobro])
            ->andFilterWhere(['like', 'user.username', $this->usuario]);

        return $dataProvider;
    }
}
