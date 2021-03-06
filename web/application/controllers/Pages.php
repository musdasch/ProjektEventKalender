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

		/**
		 * $data holds the data for the pages.
		 * @var array
		 */
		private $data = array();

		/**
		 * It is the constructor of the pages controller.
		 * It loads the url helper class for useing the base_url function or
		 * similar functions. 
		 */
		public function __construct() {
			parent::__construct();

			/**
			 * Loads the url helper for using
			 * base_url() or oder funktions.
			 */
            $this->load->helper( 'url' );

            /**
             * Loads the events model for display the data on the pages.
             */
            $this->load->model( 'events_model' );
        }

        public function index(){
        	$data[ 'events' ] = $this->nwes_model->get_events();
        }

        public function view( $page = 'home' ){

        	/**
        	 * Shows the 404 pages if dont exist a page in
        	 * the 
        	 */
			if ( ! file_exists( APPPATH.'/views/pages/' . $page . '.php' ) ){
					/* ToDo - make 404 page */
	                show_404();
	        }

	        /**
	         * Set the title and pabe_name for using in the pages and templates, the first
	         * character is capitaliced.
	         */
			$this->data[ 'title' ] = ucfirst( $page );
			$this->data[ 'page' ] = $page;

			/**
			 * Loads the tamplates and the page for a static page.
			 */
			$this->load->view( 'templates/header', $this->data );
			$this->load->view( 'templates/navigation', $this->data );
			$this->load->view( 'pages/' . $this->data[ 'page' ], $this->data );
			$this->load->view( 'templates/footer', $this->data );
        }

}