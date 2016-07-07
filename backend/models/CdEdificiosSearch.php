<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\CdEdificios;

/**
 * CdEdificiosSearch represents the model behind the search form about `backend\models\CdEdificios`.
 */
class CdEdificiosSearch extends CdEdificios
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_edificios_pk', 'cod_conjunto'], 'integer'],
            [['nombre_edificio', 'nombre_concerje', 'email_edificio'], 'safe'],
            [['telf_concerje', 'porcentaje_nro1', 'porcentaje_nro2', 'agua', 'fondo_nro1', 'fondo_nro2', 'fondo_nro3', 'fondo_nro4', 'fondo_nro5', 'fondo_nro6', 'fondo_nro7', 'fondo_nro8'], 'number'],
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
        $query = CdEdificios::find();

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
            'cd_edificios_pk' => $this->cd_edificios_pk,
            'cod_conjunto' => $this->cod_conjunto,
            'telf_concerje' => $this->telf_concerje,
            'porcentaje_nro1' => $this->porcentaje_nro1,
            'porcentaje_nro2' => $this->porcentaje_nro2,
            'agua' => $this->agua,
            'fondo_nro1' => $this->fondo_nro1,
            'fondo_nro2' => $this->fondo_nro2,
            'fondo_nro3' => $this->fondo_nro3,
            'fondo_nro4' => $this->fondo_nro4,
            'fondo_nro5' => $this->fondo_nro5,
            'fondo_nro6' => $this->fondo_nro6,
            'fondo_nro7' => $this->fondo_nro7,
            'fondo_nro8' => $this->fondo_nro8,
        ]);

        $query->andFilterWhere(['like', 'nombre_edificio', $this->nombre_edificio])
            ->andFilterWhere(['like', 'nombre_concerje', $this->nombre_concerje])
            ->andFilterWhere(['like', 'email_edificio', $this->email_edificio]);

        return $dataProvider;
    }
}
