<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CdAguas;

/**
 * CdAguasSearch represents the model behind the search form about `app\models\CdAguas`.
 */
class CdAguasSearch extends CdAguas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_aguas_pk', 'cod_conjunto', 'cod_edificio'], 'integer'],
            [['cod_apto'], 'safe'],
            [['lect_ant', 'lect_post'], 'number'],
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
        $query = CdAguas::find();

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
            'cd_aguas_pk' => $this->cd_aguas_pk,
            'cod_conjunto' => $this->cod_conjunto,
            'cod_edificio' => $this->cod_edificio,
            'lect_ant' => $this->lect_ant,
            'lect_post' => $this->lect_post,
        ]);

        $query->andFilterWhere(['like', 'cod_apto', $this->cod_apto]);

        return $dataProvider;
    }
}
