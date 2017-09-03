##Naming the location
player_csv=as.data.frame(read.csv("C:\\Users\\Hsemu\\Documents\\Freelance\\times-from-3rdparty.csv",header=TRUE,skip=10,sep=";"))

player_csv$Finish.Time=as.numeric(gsub(",", ".", player_csv$Finish.Time))
player_csv$Split.1=as.numeric(gsub(",", ".",player_csv$Split.1))
player_csv$Split.2=as.numeric(gsub(",", ".",player_csv$Split.2))
player_csv$Split.3=as.numeric(gsub(",", ".",player_csv$Split.3))

#Calculate Runs Columns
player_csv$Run[player_csv$SEQ==2] <- 1
player_csv$Run[player_csv$SEQ==3] <- 1
player_csv$Run[player_csv$SEQ==4] <- 1
player_csv$Run[player_csv$SEQ==5] <- 1
player_csv$Run[player_csv$SEQ==6] <- 2
player_csv$Run[player_csv$SEQ==7] <- 2
player_csv$Run[player_csv$SEQ==8] <- 3
player_csv$Run[player_csv$SEQ==9] <- 3
player_csv$Run[player_csv$SEQ==10] <- 3
player_csv$Run[player_csv$SEQ==11] <- 4
player_csv$Run[player_csv$SEQ==12] <- 4
player_csv$Run[player_csv$SEQ==13] <- 5

##Last split to finish column addition
player_csv$Last_Split_Time=ifelse(player_csv$Split.2==0,player_csv$Finish.Time-player_csv$Split.1,player_csv$Finish.Time-player_csv$Split.2)

##sort the data
sorted_player_csv<- player_csv[order(player_csv$Finish.Time),]
head(sorted_player_csv)

##Grouping the output
overall=player_csv[order(player_csv$Finish.Time),]
overall=overall[order(overall$Name),]
write.csv(overall,"C:\\Users\\Hsemu\\Documents\\Freelance\\All_Names_sorted_Time.csv",row.names=FALSE) 

##Selecting the rows for top 15
top_15=head(sorted_player_csv,15)
write.csv(top_15,"C:\\Users\\Hsemu\\Documents\\Freelance\\Top_15_Time.csv",row.names=FALSE) 




