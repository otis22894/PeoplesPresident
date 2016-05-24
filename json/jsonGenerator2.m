file = fileread('allJson7.json');

locs = strfind(file,sprintf('{"Bernie Sanders":'));

for i = 1:length(locs)-1
    data = file(locs(i):locs(i+1)-2);
    fh = fopen(['json_' num2str(i+308) '.json'],'w');
    fprintf(fh,'%s',data);
    fclose(fh);
end
data = file(locs(end):end);
fh = fopen(['json_' num2str(i+1+308) '.json'],'w');
fprintf(fh,'%s',data);
fclose(fh);