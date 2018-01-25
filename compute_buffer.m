function [buffer_1, buffer_2] = compute_buffers(string_1, string_2)

tmp = [length(string_1) length(string_2)];
tmp = max(tmp)-tmp;
buffer_1 = ''; for ii = 1:tmp(1); buffer_1 = [buffer_1 ' ']; end;
buffer_2 = ''; for ii = 1:tmp(2); buffer_2 = [buffer_2 ' ']; end;

end
