function dim_name = get_dim_name(name)

switch name
    case 'begc'
        dim_name = 'dimname_begc';
    case 'endc'
        dim_name = 'dimname_endc';
    case 'begl'
        dim_name = 'dimname_begl';
    case 'endl'
        dim_name = 'dimname_endl';
    case 'begg'
        dim_name = 'dimname_begg';
    case 'endg'
        dim_name = 'dimname_endg';
    case 'begp'
        dim_name = 'dimname_begp';
    case 'endp'
        dim_name = 'dimname_endp';
    case '0'
        dim_name = 'dimname_zero';
    case '1'
        dim_name = 'dimname_one';
    case '2'
        dim_name = 'dimname_two';
    case 'nlevsoi'
        dim_name = 'dimname_nlevsoi';
    case 'nlevgrnd'
        dim_name = 'dimname_nlevgrnd';
    case '-nlevsno'
        dim_name = 'dimname_nlevsno';
    case '-nlevsno + 1'
        dim_name = 'dimname_nlevsno_plus_one';
    case 'endc - begc + 1'
        dim_name = 'dimname_col_one_based_idx';
    otherwise
        error(['unknown dimension name: ' name])
        
end
