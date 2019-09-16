if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#array') and type='U') drop table #array
create table #array(k1 int identity, arraycol varchar(8000))

Insert #array(arraycol) values('great abel     '+
                               'great abel1    '+
                               'test  abel2    ')
                               

Insert #array(arraycol) values('aryat abyl     '+
                               'aryat abyl1    '+
                               'ayst  abel2    ')


Insert #array(arraycol) values('brzat abzl     '+
                               'brzat abzl1    '+
                               'bzst  abel2    ')
                               
    select 
    Element1=SUBSTRING (arraycol,(0*15)+1,15),
    Element2=SUBSTRING (arraycol,(1*15)+1,15),
    Element3=SUBSTRING (arraycol,(2*15)+1,15)
    from #array a
    
    ------------------------------------------------
    --------------------------------------------------
    declare @arrayvar varchar(8000)
    declare @i int ,@l int
    declare c cursor for select arraycol from #array
    
    open c
    fetch c into @arrayvar
    
    while (@@FETCH_STATUS =0) begin
    set @i=0
    set @l=DATALENGTH (@arrayvar)/15
      while(@i<@l) begin
        select 'Guitarist'=SUBSTRING (@arrayvar,(@i*15)+1,15)
      set  @i=@i+1
        end
     fetch c into @arrayvar
     End
    close c
    Deallocate c
     
 ----------------------------------
 if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#results') and type='U') drop table #results
 create table #results(Guitarist varchar(15))
 
 declare @arrayvar varchar(8000)
   
     declare @i int ,@l int
    declare c cursor for select arraycol from #array
    
    open c
    fetch c into @arrayvar
    
    while (@@FETCH_STATUS =0) begin
    set @i=0
    set @l=DATALENGTH (@arrayvar)/15
      while(@i<@l) begin
       insert #results select SUBSTRING (@arrayvar,(@i*15)+1,15)
      set  @i=@i+1
        end
     fetch c into @arrayvar
     End
    close c
    Deallocate c
    
    select * from #results 
    drop table #results 