<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct()
    {
        parent::__construct(); 
		$this->load->model('Incident_model');
	}
	public function save_incident()
	{
		$data = json_decode(file_get_contents('php://input'), false);
		$res = $this->Incident_model->save_incident($data);
		//print_r($data); exit;
		echo json_encode($res);
		exit();
	}
	
	public function get_incident()
	{
		$res = $this->Incident_model->get_incident();
		echo json_encode($res);
		exit();
	}
}
