<?php

error_reporting( error_reporting() & ~E_NOTICE );

class Config{
  const SERVERNAME = 'MY_SERVERNAME';
  const USERNAME = 'MY_USERNAME';
  const PASSWORD = 'MY_PASS';
  const DATABASE =  'MY_DATABASES';
  const URL = 'http://pathtocms/';
  const PREFIX = 'prefix_';
  const PREFIX_PAGE = 'page_';
  const PATH_ROOT = 'cms/public/';
}
?>