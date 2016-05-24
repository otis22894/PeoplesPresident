function jsonConverter()

[~,~,r] = xlsread('data.csv');
[rows,cols] = size(r);

template = ['\n\t"%s": {\n\t\t"id_str":"%d",'...
                       '\n\t\t"timestamp":"%s",'...
                       '\n\t\t"sentiment":"%s",'...
                       '\n\t\t"tweet_name":"%s",'...
                       '\n\t\t"tweet_text":"%s",'...
                       '\n\t\t"tweet_user_id":"%s"\n\t}'];
for i = 2:rows
   sent = r{i,3};
   sent = strrep(strrep(strrep(sent,'\','\\'),'"','\\"'),sprintf('\n'),'');
   name = r{i,4};
   name = strrep(name,'\','\\');
   text = r{i,5};
   text = strrep(strrep(strrep(text,'\','\\'),'"','\\"'),sprintf('\n'),'');
    kasich = [sprintf(template,'John Kasich',r{i,1},r{i,2},sent,name,text,r{i,6}) sprintf(',\n')];
    cruz = [sprintf(template,'Ted Cruz',r{i,1},r{i,2},sent,name,text,r{i,6}) sprintf(',\n')];
    sanders = [sprintf(template,'Bernie Sanders',r{i,1},r{i,2},sent,name,text,r{i,6}) sprintf(',\n')];
    clinton = [sprintf(template,'Hillary Clinton',r{i,1},r{i,2},sent,name,text,r{i,6}) sprintf('\n')];
    trump = [sprintf(template,'Donald Trump',r{i,1},r{i,2},sent,name,text,r{i,6}) sprintf(',\n')];
 
    file = ['{' kasich,cruz,trump,sanders,clinton '}'];
    fh = fopen(['json_' num2str(i-1) '.json'],'w');
    fprintf(fh,file);
    fclose(fh);
    
end

end