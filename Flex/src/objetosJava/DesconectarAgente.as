// ActionScript file
package objetosJava{
	import flash.display.DisplayObject;
	
	import mx.messaging.Producer;
	import mx.rpc.remoting.RemoteObject;
	
public class DesconectarAgente{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.data.ChangeObject;
	import mx.data.ChangedItems;
	import mx.events.CloseEvent;
	import mx.events.CollectionEvent;
	import mx.events.FlexEvent;
	import mx.events.IndexChangedEvent;
	import mx.events.ListEvent;
	import mx.events.ValidationResultEvent;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	import mx.events.ValidationResultEvent;
	import mx.messaging.messages.AsyncMessage;
	import mx.messaging.messages.ErrorMessage;
	
	//POP UP
	import spark.components.TitleWindow;
	import flash.events.*;
	import mx.managers.PopUpManager;
	import spark.components.Button;
	import mx.core.IFlexDisplayObject;
	import spark.components.Button;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.TitleWindow;
	import spark.components.Label;
	
	
	import objetosJava.*;
	
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	import mx.validators.NumberValidator;
	
	[Bindable] public var endpoint:String;
	[Bindable] public var nombreCatalogo:String;
	[Bindable] public var usuariologeado:Usuario;
	
	public var msg:AsyncMessage = new AsyncMessage();
	private var roDesconectarAgente:RemoteObject;
	private var messageProducer:Producer;
	private var id_usr:int;
	private var nombre:String;
	
	private var bandera_todos:Boolean = false;
	private var bandera_mensaje_todos:Boolean = false;
	
	private var ar_agentes:ArrayCollection;
	
	
	private function numberValidator_invalid(evt:ValidationResultEvent):void {
		Alert.show("Debe ingresar solo números \nEl intervalo permitido es de 1 - 60 minutos.")
	}
	
	private function numberValidator_valid(evt:ValidationResultEvent):void {
		//Alert.show(evt.type);				
		if( int(te_minutos.text ) < 1 ){
			Alert.show("Como mínimo debe seleccionar 1 minuto.");
			te_minutos.text='1';	
		}
		else{
			actualizaMensaje();
		}				
	}
	
	private function cargaDatos():void{
		te_minutos.text='1';
		actualizaMensaje();
	}
	
	private function actualizaMensaje():void{
		ta_mensaje.text = "Será desconectado en "+te_minutos.text+" minutos.";
	}
	
	private function faultHandler(event:FaultEvent):void
	{
		Alert.show(event.fault.faultString,"Error");
	}
	
	
	
	private function desconexion(event:MouseEvent):void{
		var minutos:String= te_minutos.text;
		var mensaje:String =  ta_mensaje.text;
		var obj:Object;
		msg = new AsyncMessage();
		
		if(bandera_mensaje_todos){
			enviarMensajeTodos();
			return;
		}
		
		if(bandera_todos){ // Se hara uso del arrayCollection para obtener los nombres de los agentes
			var nombre_l:String = "";
			var id_usr_l:int = 0;
			
			
			
			for(var i:int = 0; i<ar_agentes.length;i++){
				nombre_l = ar_agentes[i].nombre_usr;
				id_usr_l = ar_agentes[i].id_usr;
				
				obj = new Object();
				msg = new AsyncMessage();
				//Alert.show("Desconectando a nombre: "+nombre_l+"\nid_usr: "+id_usr_l);
				
				obj["nombre"] = nombre_l; //El nombre del contacto con quien comparto la conversacion
				obj["usuario"] = id_usr_l; //El id_usr con quien comparto la conversacion
				
				obj["f_nombre"]=usuariologeado.nombre_usr;//Nombre del usuario en sesion
				obj["f_id_usr"]=usuariologeado.id_usr; //ID_USR del usuario en sesion
				obj["type"] = "disconect-message"; 
				obj["message"]=mensaje;
				obj["time"]=minutos;
				msg.headers = obj;
				roDesconectarAgente.desconexion(id_usr_l,minutos);  //Actualizacion a base de datos sobre la desconexion
				messageProducer.send(msg);						  //Actualizacion al sistema sobre la desconexion
				
			}
		
			PopUpManager.removePopUp(myTitleWindow);
			return;
		}
		
		obj = new Object();
		
		obj["nombre"] = nombre; //El nombre del contacto con quien comparto la conversacion
		obj["usuario"] = id_usr; //El id_usr con quien comparto la conversacion
		
		obj["f_nombre"]=usuariologeado.nombre_usr;//Nombre del usuario en sesion
		obj["f_id_usr"]=usuariologeado.id_usr; //ID_USR del usuario en sesion
		obj["type"] = "disconect-message"; 
		obj["message"]=mensaje;
		obj["time"]=te_minutos.text;
		msg.headers = obj;
		roDesconectarAgente.desconexion(id_usr,minutos);  //Actualizacion a base de datos sobre la desconexion
		messageProducer.send(msg);						  //Actualizacion al sistema sobre la desconexion
		
		PopUpManager.removePopUp(myTitleWindow);
		return;
	}
	
	private function enviarMensajeTodos():void{
		
		var mensaje:String =  ta_mensaje.text;
		var obj:Object;
		
		var nombre_l:String = "";
		var id_usr_l:int = 0;
		
		
		
		for(var i:int = 0; i<ar_agentes.length;i++){
			nombre_l = ar_agentes[i].nombre_usr;
			id_usr_l = ar_agentes[i].id_usr;
			
			obj = new Object();
			msg = new AsyncMessage();
			//Alert.show("Enviando Mensaje a nombre: "+nombre_l+"\nid_usr: "+id_usr_l);
			
			obj["nombre"] = nombre_l; //El nombre del contacto con quien comparto la conversacion
			obj["usuario"] = id_usr_l; //El id_usr con quien comparto la conversacion
			
			obj["f_nombre"]=usuariologeado.nombre_usr;//Nombre del usuario en sesion
			obj["f_id_usr"]=usuariologeado.id_usr; //ID_USR del usuario en sesion
			obj["type"] = "messenger_message"; 
			obj["message"]=mensaje;
			msg.headers = obj;
			
			messageProducer.send(msg);						  //Actualizacion al sistema sobre la desconexion
			
		}
		
		PopUpManager.removePopUp(myTitleWindow);
		return;
	}
	

	
		
	protected function myTitleWindowClose(evt:CloseEvent):void {
		PopUpManager.removePopUp(evt.currentTarget as IFlexDisplayObject);
	}
	
	// The variable for the TitleWindow container
	public var myTitleWindow:TitleWindow = new TitleWindow();
	
	// Method to instantiate and display a TitleWindow container.
	// This is the initial Button control's click event handler.
	public function openWindow(event:MouseEvent, id_usr:int , nombre:String, componente:DisplayObject, 
							   roDesconectarAgente:RemoteObject, messageProducer:Producer):void {
		// Set the TitleWindow container properties.
		this.id_usr = id_usr;
		this.nombre = nombre;
		this.messageProducer = messageProducer;
		this.roDesconectarAgente=roDesconectarAgente;
		myTitleWindow = new TitleWindow();
		myTitleWindow.title = "Desconectar a "+nombre;
		myTitleWindow.width= 518;
		myTitleWindow.height= 255;
		myTitleWindow.addEventListener(CloseEvent.CLOSE, myTitleWindowClose);
		// Call the method to add the Button control to the 
		// TitleWindow container.
		populateWindow();
		// Use the PopUpManager to display the TitleWindow container.
		
		PopUpManager.addPopUp(myTitleWindow, componente, true);
		PopUpManager.centerPopUp(myTitleWindow);		
	}
	
	//openWindow(event,dg_monitor_agentes.dataProvider,this,roDesconectarAgente,messageProducer);
	//Funcion que funciona para la desconexion de todos los agentes en un dataprovider
	public function openWindowTodos(event:MouseEvent, ar_agentes:ArrayCollection   , componente:DisplayObject, 
							   
							   roDesconectarAgente:RemoteObject, messageProducer:Producer):void {
		// Set the TitleWindow container properties.

		this.messageProducer = messageProducer;
		this.roDesconectarAgente=roDesconectarAgente;
		this.bandera_todos=true;
		this.ar_agentes = ar_agentes;
			
		myTitleWindow = new TitleWindow();
		myTitleWindow.title = "Desconectar a Todos";
		myTitleWindow.width= 518;
		myTitleWindow.height= 255;
		
		// Call the method to add the Button control to the 
		// TitleWindow container.
		
		populateWindow();
		
		// Use the PopUpManager to display the TitleWindow container.
		PopUpManager.addPopUp(myTitleWindow, componente, true);
		PopUpManager.centerPopUp(myTitleWindow);	
		
		
	}
	
	
	public function openWindowMensajeTodos(event:MouseEvent, ar_agentes:ArrayCollection, componente:DisplayObject,
										   messageProducer:Producer):void {
		// Set the TitleWindow container properties.
		
		this.messageProducer = messageProducer;
		this.bandera_mensaje_todos=true;
		this.ar_agentes = ar_agentes;
		
		myTitleWindow = new TitleWindow();
		myTitleWindow.title = "Enviar mensaje a Todos";
		myTitleWindow.width= 518;
		myTitleWindow.height= 255;
		
		// Call the method to add the Button control to the 
		// TitleWindow container.
		
		populateWindow();
		
		
		myTitleWindow.removeElement(te_minutos);
		myTitleWindow.removeElement(label_tiempo_desc);
		myTitleWindow.removeElement(label_minutos);
		validador_minutos.enabled=false;
		
		ta_mensaje.text="";

		
		
		// Use the PopUpManager to display the TitleWindow container.
		PopUpManager.addPopUp(myTitleWindow, componente, true);
		PopUpManager.centerPopUp(myTitleWindow);	
		
		
	}
	
	
	private var btn2:Button = new Button();
	private var btn1:Button = new Button();
	private var te_minutos:TextInput = new TextInput();
	private var ta_mensaje:TextArea = new TextArea();
	private var label_tiempo_desc:Label = new Label();
	private var label_minutos:Label = new Label();
	private var label_mensaje:Label = new Label();
	private var validador_minutos:NumberValidator =new NumberValidator();
	// The method to create and add the Button child control to the
	// TitleWindow container.
	public function populateWindow():void {
		
		myTitleWindow.addEventListener(CloseEvent.CLOSE, myTitleWindowClose);
		
		btn2.label = "Aceptar"
		btn2.x= 418
		btn2.y = 10
		btn2.addEventListener(MouseEvent.CLICK, desconexion);	
		
		
		btn1.label="Cancelar";
		btn1.x= 418
		btn1.y = 50
		btn1.addEventListener(MouseEvent.CLICK, closeTitleWindow);
		
		
		te_minutos.text='1';
		te_minutos.x=150;
		te_minutos.y=10;
		
		
		
		ta_mensaje.text = 'Será desconectado en '+te_minutos.text+' minutos.';
		ta_mensaje.x=150;
		ta_mensaje.y=50;
		
		
		
		label_tiempo_desc.text = "Tiempo de desconexión: ";
		label_tiempo_desc.x = 10
		label_tiempo_desc.y = 10
		
		
		label_minutos.text = " minutos. ";
		label_minutos.x=290;
		label_minutos.y=10;
		
		
		label_mensaje.text = "Mensaje: ";
		label_mensaje.x=70;
		label_mensaje.y=50;
		
		//Validador Numerico
		
		
		validador_minutos.source=te_minutos;
		validador_minutos.property="text";
		validador_minutos.domain="int";
		validador_minutos.minValue=1;
		validador_minutos.maxValue=60;
		validador_minutos.allowNegative=false;
		validador_minutos.addEventListener(ValidationResultEvent.INVALID, numberValidator_invalid);
		validador_minutos.addEventListener(ValidationResultEvent.VALID, numberValidator_valid);
		
		
		
		myTitleWindow.addElement(btn1);  
		myTitleWindow.addElement(btn2);  
		myTitleWindow.addElement(te_minutos); 
		myTitleWindow.addElement(ta_mensaje); 
		myTitleWindow.addElement(label_tiempo_desc); 
		myTitleWindow.addElement(label_minutos); 
		myTitleWindow.addElement(label_mensaje); 
	}
	
	
	
	// The method to close the TitleWindow container.
	public function closeTitleWindow(event:MouseEvent):void {
		PopUpManager.removePopUp(myTitleWindow);
	}
	
	private function resultHandlerDesconexion(event:ResultEvent):void{
		Alert.show("Enviado con éxito.","Aviso");
		//Alert.show(event.toString());
	}

}

}