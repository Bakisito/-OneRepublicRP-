// The icons used are from https://icons.getbootstrap.com/

// Example <i class="bi bi-exclamation-triangle"></i>
// As seen on https://icons.getbootstrap.com/icons/exclamation-triangle/

window['locales'] = {
    "front_camera":"Frente",
    "rear_camera":"Trasera",

    "toggle_typing":"Haga clic para activar el menú",
    "toggle_typing_message":`Asegúrese de que estas bien aparcado. <i class="bi bi-exclamation-triangle"></i>`,

    // BOLO
    "create_bolo_title":"Crear un BOLO",

    "create_bolo_type":"Tipo",
    "create_type_bolo":"BOLO",
    "create_type_marker":"Marker",

    "create_bolo_plate":"Placa",
    "create_plate_helper":"La placa debe tener o menos de 8 caracteres (incluidos los espacios en blanco)",

    "create_bolo_model":"Modelo",
    "create_model_helper":"El modelo debe tener o menos de 32 caracteres.",

    "create_bolo_colour":"Color",
    "create_colour_helper":"El color debe ser fijo y tener menos de 16 caracteres.",

    "create_bolo_marker":"Razón",
    "create_marker_helper":"Es necesario establecer el motivo.",

    "create_bolo_notes":"Notas",
    "create_notes_helper":"",

    "create_bolo_button":"Crear BOLO",
    "create_bolo_button_success":"Success!",
    "create_bolo_button_fail":"No se puede crear",

    // Search
    "search_plate_placeholder":"Empieza a teclear para buscar...",
    "search_delete":"Borrar",
    "search_confirm":`¿Estás seguro?`,

    // Settings
    "settings_autolock":"Activar bloqueo automático",
    "settings_autolock_helper":"Activa el bloqueo automático de los vehículos señalizados.",

    "settings_log_size":"Tamaño del registro",
    "settings_log_size_helper":"Cambia cuántos registros se guardan por cámara.",
    
    "settings_speed_increment":"Incremento de velocidad",
    "settings_speed_increment_helper":"Cambia el valor de incremento/decremento para establecer los límites de velocidad.",

    "settings_sound":"Volumen del sonido",
    "settings_sound_helper":"Enmudece, haz que te sangren los oídos, o algo intermedio.",

    "settings_scale":"Escala",
    "settings_scale_helper":"Aumenta o disminuye el tamaño del radar.",

    "settings_theme":"Theme",
    "settings_theme_helper":"Elige tu veneno...",

    "settings_reset":"Restablecer ajustes",

    // Context (Right click) menu on logs
    "context_menu_copy":`<a href="#"><i class="bi bi-clipboard-fill"></i> Copiar al portapapeles</a>`,
    "context_menu_create":`<a href="#"><i class="bi bi-file-earmark-plus-fill"></i> Crear alerta</a>`,
    "context_menu_owner":`<a href="#"><i class="bi bi-person-bounding-box"></i> Buscar propietario</a>`,
    "context_menu_delete":`<a href="#"><i class="bi bi-x-circle-fill"></i> Borrar este registro</a>`,

    // Other
    "bolo_shorthand":'B',
    "marker_shorthand":'M',

    "speed_unit":"KMH" // MAKE SURE TO CHANGE THE Config.SpeedMultiplier IN ./config.lua IF YOU ARE CHANGING TO KMH
};

window['screenNames'] = {
    "radar":"Radar",
    "alerts": "Alertas",
    "search": "Búsqueda",
    "logs": "Registros",
    "settings":"Ajustes"
}