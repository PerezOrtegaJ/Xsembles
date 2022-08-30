function p_text = P_To_Text(p)
% convert the p-value into its representative text (asterisks '*' or 'NS')
%
%   p_text = P_To_Text(p)
%
% By Jesus Perez-Ortega, Feb 2022

if p<0.001
    p_text = '***';
elseif p<0.01
    p_text = '**';
elseif p<0.05
    p_text = '*';
else
    p_text = 'NS';
end
