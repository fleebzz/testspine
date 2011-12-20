<?php

class ApiController extends Controller {
	private $format = 'json';

	private function getModelName($model){
		$modelName = substr($model, 0, -1);
		$modelName = ucfirst(strtolower($modelName));

		return $modelName;
	}

	public function actionGet($model){
		$modelName = $this->getModelName($model);

		$items = $modelName::model()->findAll();

		echo CJSON::encode($items);
	}

	// public function actionGet($model, $id){
	// 	$modelName = $this->getModelName($model);

	// 	$items = $modelName::model()->findByPk($id);

	// 	echo CJSON::encode($items);
	// }

	public function actionPost($model){
		$modelName = $this->getModelName($model);

		$params = CJSON::decode(file_get_contents('php://input'));
		if(isset($params['id'])){
			unset($params['id']);
		}

		$item = new $modelName();
		$item->attributes = $params;
		$item->save();

		echo CJSON::encode($item->attributes);
	}

	public function actionPut($model, $id){

		$modelName = $this->getModelName($model);

		$item = $modelName::model()->findByPk($id);
		$itemId = $item->id;

		$params = CJSON::decode(file_get_contents('php://input'));

		$item->attributes = $params;
		$item->id = $itemId;
		$item->save();

		echo CJSON::encode($item->attributes);
	}

	public function actionDelete($model, $id){

		$modelName = $this->getModelName($model);

		$item = $modelName::model()->findByPk($id);

		$item->delete();
	}
}

?>