<?php
class Events_model extends CI_Model {
	public function __construct(){
		$this->load->database();
	}

	public function get_news($slug = FALSE){
        if ($slug === FALSE){
                $query = $this->db->get('veranstaltung');
                return $query->result_array();
        }

        $query = $this->db->get_where('veranstaltung', array('name' => $slug));
        return $query->row_array();
}


}