.mode columns
.header on
.nullvalue NULL

Create Trigger Language_Filter
AFTER INSERT On Comment
FOR EACH ROW
    BEGIN
        UPDATE Comment SET content = REPLACE(content,'fuck','****') WHERE content LIKE '%fuck%';
        UPDATE Comment SET content = REPLACE(content,'Fuck','****') WHERE content LIKE '%Fuck%';
End;