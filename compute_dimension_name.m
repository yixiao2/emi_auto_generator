function out_dim_name = compute_dimension_name(inp_dim_name)

switch inp_dim_name
    case 'begg'
        out_dim_name = 'dimname_begg';
    case 'endg'
        out_dim_name = 'dimname_endg';
    case 'begl'
        out_dim_name = 'dimname_begl';
    case 'endl'
        out_dim_name = 'dimname_endl';
    case 'begc'
        out_dim_name = 'dimname_begc';
    case 'endc'
        out_dim_name = 'dimname_endc';
    case 'begp'
        out_dim_name = 'dimname_begp';
    case 'endp'
        out_dim_name = 'dimname_endp';
    case '-nlevsno'
        out_dim_name = 'dimname_nlevsno';
    case {'-nlevsno + 1','-nlevsno+1'}
        out_dim_name = 'dimname_nlevsno_plus_one';
    case 'nlevsoi'
        out_dim_name = 'dimname_nlevsoi';
    case 'nlevgrnd'
        out_dim_name = 'dimname_nlevgrnd';
    case '0'
        out_dim_name = 'dimname_zero';
    case '1'
        out_dim_name = 'dimname_one';
    case '2'
        out_dim_name = 'dimname_two';
    case {'endc - begc + 1','endc-begc+1'}
        out_dim_name = 'dimname_col_one_based_idx';
    otherwise
        error(['Unsupported dimension name: ' inp_dim_name]);
end