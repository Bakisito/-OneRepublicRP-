const locale = {
  cd_dispatch_small_title: "No hay llamadas de emergencia",
  cd_dispatch_small_previous: "Anterior",
  cd_dispatch_small_next: "Siguiente",
  cd_dispatch_small_respond: "Responder",
  cd_dispatch_small_mode: "Presione el boton derecho del mouse para salir del modo movimiento.",

  cd_dispatch_main_show_refresh_bar: "Mostrar",
  cd_dispatch_main_hide_refresh_bar: "Ocultar",
  cd_dispatch_main_refresh: "Refresh blips",
  cd_dispatch_main_close_refresh_bar: "Cerrar",
  cd_dispatch_main_refresh_last: "Ultima Actualización",

  cd_dispatch_main_units_responding: "Unidad(es) en respuesta",

  cd_dispatch_unit_list: "Lista de Unidades",

  cd_dispatch_main_dropdown_respond: "Responder la notificación",
  cd_dispatch_main_dropdown_remove_response: "Eliminar respuesta de notificación",
  cd_dispatch_main_dropdown_remove_notification: "Eliminar esta notificación",
  cd_dispatch_main_dropdown_remove_all: "Eliminar todas las notificaciones",
  cd_dispatch_main_dropdown_assign_all: "Asignar cada unidad al llamado",

  cd_dispatch_main_modal_title: "Ajuste de Emergencias",
  cd_dispatch_main_modal_autodel: "Borrar automático después de",
  cd_dispatch_main_modal_autodel_desc:"El tiempo necesario para eliminar automáticamente la notificación. (En minutos, 1-60)",
  cd_dispatch_main_modal_set_callsign:"Actualizar Callsign",
  cd_dispatch_main_modal_set_callsign_help:"Este Callsign será visible para todos los usuarios de despacho",
  cd_dispatch_main_modal_assigned_vehicle:"Vehiculo asignado",
  cd_dispatch_main_modal_close: "Cerrar",
  cd_dispatch_main_modal_save: "Guardar Cambios",
  cd_dispatch_main_modal_vehicle_foot:" A pie",
  cd_dispatch_main_modal_vehicle_car:" Carro",
  cd_dispatch_main_modal_vehicle_motorcycle:" Motocicleta",
  cd_dispatch_main_modal_vehicle_helicopter:" Helicoptero",
  cd_dispatch_main_modal_vehicle_boat: " Barco",
  cd_dispatch_main_modal_sound_control: "Control de Sonido",
  cd_dispatch_main_modal_mute_sounds: " Silenciar sonidos",
  cd_dispatch_main_modal_mute_sounds_description: "Esta opción silenciará los sonidos de pánico y notificación",
  cd_dispatch_main_modal_enable_dispatcher: "Enable dispatcher mode?",
  cd_dispatch_main_modal_toggle_button:"Toggle dispatcher mode",
  cd_dispatch_main_modal_dispatcher_status: "Dispatcher mode is currently",
  cd_dispatch_main_modal_dispatcher_status_enabled: "habilitar.",
  cd_dispatch_main_modal_dispatcher_status_disabled: "desabilitar.",

  cd_dispatch_unit_dropdown_gps: "Fijar ubicación GPS",
  cd_dispatch_unit_join_radio:"Unirse al canal de radio",
  cd_dispatch_unit_leave_radio:"Dejar el canal de radio",

  cd_dispatch_toggle_voice_on: "Activar voz",
  cd_dispatch_toggle_voice_off: "Desactivar voz",
  cd_dispatch_revert_map: "Revertir",

  cd_dispatch_notification_panel: "Panel de notificaciones",

  cd_dispatch_settings_status: "Status",
  cd_dispatch_settings_status_help: "Selecciona tu estado actual.",

  cd_dispatch_units_notification: "Ninguna unidad responde",

  cd_dispatch_tamper_message: "¿Has manipulado los valores?",
  cd_dispatch_callsign_message: "El codigo debe tener menos de 16 caracteres.",

};

let statusMessages = [
  {name:"Available", color:"#539D1B"}, // The status will default to the first one in the list
  {name:"Unavailable", color:"#F05B56"},
  {name:"Processing", color:"#E46211"},
  {name:"Training", color:"#009DE0"},
  {name:"Undercover", color:"#2E570F"},
]

moment.locale("en"); // The locale of the time on top of the small UI

// Possible locales v
// en,af,ar-dz,ar-kw,ar-ly,ar-ma,ar-sa,ar-tn,ar,az,be,bg,bm,bn-bd,bn,bo,br,bs,ca,cs,cv,cy,da,de-at,de-ch,de,dv,el,en-au,en-ca,en-gb,en-ie,en-il,en-in,en-nz,en-sg,eo,es-do,es-mx,es-us,es,et,eu,fa,fi,fil,fo,fr-ca,fr-ch,fr,fy,ga,gd,gl,gom-deva,gom-latn,gu,he,hi,hr,hu,hy-am,id,is,it-ch,it,ja,jv,ka,kk,km,kn,ko,ku,ky,lb,lo,lt,lv,me,mi,mk,ml,mn,mr,ms-my,ms,mt,my,nb,ne,nl-be,nl,nn,oc-lnc,pa-in,pl,pt-br,pt,ro,ru,sd,se,si,sk,sl,sq,sr-cyrl,sr,ss,sv,sw,ta,te,tet,tg,th,tk,tl-ph,tlh,tr,tzl,tzm-latn,tzm,ug-cn,uk,ur,uz-latn,uz,vi,x-pseudo,yo,zh-cn,zh-hk,zh-mo,zh-tw
