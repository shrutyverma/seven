<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Incident_model extends CI_Model {
	public function save_incident($data_set){
		//print_r($data_set);exit;
		$res = array();
		if(count($data_set) > 0){
			$data = $data_set->data;
			
			if($data[0]->location->latitude == '' || $data[0]->location->latitude == NULL || !is_numeric($data[0]->location->latitude)){
				$res['status'] = 'fail';
				$res['message'] = 'Invalid latitude';
				return $res;
			}
			if($data[0]->location->longitude == '' || $data[0]->location->longitude == NULL || !is_numeric($data[0]->location->longitude)){
				$res['status'] = 'fail';
				$res['message'] = 'Invalid longitude';
				return $res;
			}
			if($this->checkIsAValidDate($data[0]->incidentDate) == false){
				$res['status'] = 'fail';
				$res['message'] = 'Invalid Incident Date';
				return $res;
			}
			
			if($data[0]->category == '' || $data[0]->category == NULL){
				$res['status'] = 'fail';
				$res['message'] = 'Invalid Category';
				return $res;
			}else{
				$this->db->where('id', $data[0]->category);
				$query = $this->db->get('category');
				$category = $query->result();
				if(count($category) == 0){
					$res['status'] = 'fail';
					$res['message'] = 'Category Not Exist';
					return $res;
				}
			}
				
			
			if($data[0]->createDate == ''){
				$createDate = date('Y-m-d H:i:s');
			}else{
				$createDate = $data[0]->createDate;
			}
			
			if($data[0]->modifyDate == ''){
				$modifyDate = date('Y-m-d H:i:s');
			}else{
				$modifyDate = $data[0]->modifyDate;
			}
			
			//echo '<pre>';
			
			///print_r($data->data[0]->people); exit;
			$d = array(
					'latitude'=>$data[0]->location->latitude,
					'longitude'=>$data[0]->location->longitude,
					'title'=>$data[0]->title,
					'category'=>$data[0]->category,
					'comments'=>$data[0]->comments,
					'incidentDate'=>$data[0]->incidentDate,
					'createDate'=>$createDate,
					'modifyDate'=>$modifyDate
				);
			$this->db->insert('incident',$d);
			$incident_id = $this->db->insert_id();
			foreach($data[0]->people as $row){
				//print_r($row);
				$insert = array(
					'incident_id'=>$incident_id,
					'name'=>$row->name,
					'type'=>$row->type
				);
				$this->db->insert('people',$insert);
			}
			
			$res['status'] = 'success';
		}else{
			$res['status'] = 'fail';
			$res['message'] = 'No Data';
		}
		return $res;
	}
	public function get_incident(){
		
		$query = $this->db->get('incident');
		$users = $query->result();
		$response = array();
		$i = 0;
		foreach($users as $row){
			$this->db->select('name');
			$this->db->where('id', $row->category);
			$query = $this->db->get('category');
			$category = $query->result();
			
			$this->db->select('name,type');
			$this->db->where('incident_id', $row->id);
			$query = $this->db->get('people');
			$people = $query->result();
			$response['data'][$i]['id'] = $row->id;
			$response['data'][$i]['location']['latitude'] = $row->latitude;
			$response['data'][$i]['location']['longitude'] = $row->longitude;
			$response['data'][$i]['title'] = $row->title;
			$response['data'][$i]['category_id'] = $row->category;
			$response['data'][$i]['category'] = $category[0]->name;
			$response['data'][$i]['people'] = $people;
			$response['data'][$i]['comments'] = $row->comments;
			$response['data'][$i]['incidentDate'] = $row->incidentDate;
			$response['data'][$i]['createDate'] = $row->createDate;
			$response['data'][$i]['modifyDate'] = $row->modifyDate;
			
			
			
			$i++;
		}
		return $response;
	}
	
	
	
	public function checkIsAValidDate($myDateString){
		return (bool)strtotime($myDateString);
	}
	


	
	
}

?>