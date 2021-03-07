function lean_prompt_height
    _tide_title 'Prompt Height'

    _tide_option 1 'One line'
    _find_and_remove newline fake_tide_left_prompt_items
    _tide_display_prompt

    _tide_option 2 'Two lines'
    set -g fake_tide_left_prompt_items $fake_tide_left_prompt_items[1..-2] newline $fake_tide_left_prompt_items[-1]
    _tide_display_prompt

    _tide_menu
    switch $_tide_selected_option
        case 1
            _find_and_remove newline fake_tide_left_prompt_items
            _next_choice all/prompt_connection_andor_frame_color
        case 2
            _find_and_remove newline fake_tide_left_prompt_items
            set -g fake_tide_left_prompt_items $fake_tide_left_prompt_items[1..-2] newline $fake_tide_left_prompt_items[-1]
            _next_choice all/prompt_connection
    end
end
