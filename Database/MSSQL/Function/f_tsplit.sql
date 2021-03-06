/****** Object:  UserDefinedFunction [dbo].[f_tsplit]    Script Date: 2/20/2019 10:12:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER function [dbo].[f_tsplit](@c varchar(2000),@split varchar(2)) 
returns @t table(ID int identity(1, 1), SegmentValue varchar(200)) 
as 
    begin 
    
      while(charindex(@split,@c)<>0) 
        begin 
          insert @t(SegmentValue) values (substring(@c,1,charindex(@split,@c)-1)) 
          set @c = stuff(@c,1,charindex(@split,@c),'') 
        end 
      insert @t(SegmentValue) values (@c) 
      return 
    end 


