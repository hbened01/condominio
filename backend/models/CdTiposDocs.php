<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "cd_tipos_docs".
 *
 * @property integer $cd_tipo_doc_pk
 * @property string $tipo_doc
 * @property string $descrip_doc
 *
 * @property CdPagos[] $cdPagos
 */
class CdTiposDocs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_tipos_docs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tipo_doc', 'descrip_doc'], 'required'],
            [['tipo_doc'], 'string', 'max' => 1],
            [['descrip_doc'], 'string', 'max' => 25],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_tipo_doc_pk' => 'Cd Tipo Doc Pk',
            'tipo_doc' => 'Tipo Doc',
            'descrip_doc' => 'Descrip Doc',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPagos()
    {
        return $this->hasMany(CdPagos::className(), ['cod_tipo_doc' => 'cd_tipo_doc_pk']);
    }
}
