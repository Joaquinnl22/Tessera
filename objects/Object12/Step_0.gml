if (keyboard_check_pressed(vk_enter)) {
    if (string_pos("36", keyboard_string) > 0) {
		audio_play_sound(sndExito, 10, false);
        room_goto(rm_view_open_door_daughter);
        show_debug_message("El mensaje contiene '36'.");
    } else {
        // La palabra "12" no se encuentra en el mensaje
        show_debug_message("El mensaje NO contiene '36'.");
		count++;
		audio_play_sound(sndMalo, 10, false);
		if (count > 10) {global.hint1a=1;};
			keyboard_string = "";
				message = "";
    }
} else {
    if (string_length(keyboard_string) < limit) {
        message = keyboard_string;
        show_debug_message("Mensaje actualizado a: " + message);
    } else {
        // El mensaje excede el límite, reiniciar el mensaje
        keyboard_string = message;
        show_debug_message("keyboard_string reseteado a: " + keyboard_string);
    }
}