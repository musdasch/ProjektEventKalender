<?php
/**
 * [ Controller: Pages ]
 * This is the pages controller it's uset
 * for control the different pages of the
 * ProjektEventKalender webpage.
 *
 * @author Tim Voegtli tim.voegtli@gibmit.ch
 * @version 1.0 First version of an page controller.
 */
class Pages extends CI_Controller {

        public function view( $page = 'home' ){
        	/**
        	 * Shows the 404 pages if dont exist a page in
        	 * the 
        	 */
			if ( ! file_exists( APPPATH.'/views/pages/'.$page.'.php' ) ){
	                show_404();
	        }

	        /**
	         * Set the title for using in the pages and templates, the first
	         * character is capitaliced.
	         */
			$data[ 'title' ] = ucfirst($page);

			/**
			 * Loads the tamplates and the page for a static page.
			 */
			$this->load->view('templates/header', $data);
			$this->load->view('pages/'.$page, $data);
			$this->load->view('templates/footer', $data);
        }

}