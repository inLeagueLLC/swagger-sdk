/**
* Copyright Ortus Solutions, Corp, All rights reserved
* www.ortussolutions.com
* ---
*/
component{

	// Module Properties
	this.title 				= "ColdBox Swagger SDK";
	this.author 			= "Ortus Solutions";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "RESTful Tools For Lazy Experts";
	this.version			= "@build.version@+@build.number@";
	this.viewParentLookup 	= true;
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "SwaggerSDK";
	// Model Namespace
	this.modelNamespace		= "SwaggerSDK";
	// CF Mapping
	this.cfmapping			= "SwaggerSDK";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies That Must Be Loaded First, use internal names or aliases
	this.dependencies		= [ "cbjavaloader" ];

	/**
	* Configure App
	*/
	function configure(){}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

		var configSettings = controller.getConfigSettings();

		//ensure cbjavaloader is an activated module
		if(!Wirebox.getColdbox().getModuleService().isModuleActive('cbjavaloader')){
			Wirebox.getColdbox().getModuleService().reload('cbjavaloader');	
		}
		
		
		// load jars
		wirebox.getInstance("loader@cbjavaloader").appendPaths( modulePath & "/lib");
		

		/**	
		* Utilities
		**/

		//models.Mongo.Util
		binder.map( "OpenAPIUtil@SwaggerSDK" )
			.to( "#moduleMapping#.models.OpenAPI.Util" )
			.asSingleton();


		/**
		* Manual Instantiation Instances
		**/

		//models.OpenAPI.Document
		binder.map( "OpenAPIDocument@SwaggerSDK" )
			.to( '#moduleMapping#.models.OpenAPI.Document' )
			.noInit();


		//models.OpenAPI.Parser
		binder.map( "OpenAPIParser@SwaggerSDK" )
			.to( '#moduleMapping#.models.OpenAPI.Parser' )
			.mixins( '/#this.cfmapping#/models/mixins/hashMap.cfm' )
			.noInit();

	}


}