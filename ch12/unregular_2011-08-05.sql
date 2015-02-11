use pubs

select authors =
 case when au_fname =(select MIN(au_fname) from authors where au_lname =a.au_lname)
    then au_lname 
    else '  '
    end + CHAR(13)+CHAR(9)+au_fname 
from authors a