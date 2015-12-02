<?php
/**
 * [ Model: Events ]
 * This is the Events model it is used for
 * get the event datas from the database.
 *
 * @author Tim Voegtli tim.voegtli@gibmit.ch
 * @version 1.0 It is the first vrsion of a event model.
 */
class Events_model extends CI_Model {

        /**
         * It is the constructor of the Events model.
         * It loads the database helper for communication
         * with the mysql database.
         */
	public function __construct(){

                /**
                 * It loads the database helper.
                 */
		$this->load->database();
	}

        /**
         * the get_events function is used for get the
         * events datas from the events model.
         * @param  String $slug  it's used for get a specific event called by name.
         * @return Mixed         Returns NULL if is no data there.
         */
	public function get_events($slug = FALSE){
                /**
                 * if is $slug false by default so return all events
                 * @var boolean
                 */
                if ($slug === FALSE){
                        $query = $this->db->get('veranstaltung');
                        return $query->result_array();
                }

                /**
                 * Have $slug a name form a event so return the event.
                 */
                $query = $this->db->get_where('veranstaltung', array('name' => $slug));
                return $query->row_array();
        }
}