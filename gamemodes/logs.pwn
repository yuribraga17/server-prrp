forward RegLog(strl[]);
forward LogCMD_A(playerid, strl[]);
forward LogCMD_AM(strl[]);
forward LogCMD_FAC(strl[]);
forward LogCMD_PAGAR(strl[]);
forward LogCMD_ROJAO(strl[]);
forward LogCMD_venderdroga(strl[]);
forward LogCMD_EntregarA(strl[]);
forward LogCMD_Mascara(strl[]);
forward LogCMD_Anuncio(strl[]);
forward LogCMD_barricada(strl[]);
forward LogCMD_b(strl[]);
forward LogCMD_me(strl[]);
forward LogCMD_do(strl[]);
forward LogCMD_Savings(strl[]);
forward LogCMD_sacar(strl[]);
forward LogCMD_deposito(strl[]);
forward LogCMD_transf(strl[]);
forward LogCMD_dargrana(strl[]);
forward LogCMD_dararma(strl[]);
forward LogCMD_explodircaixa(strl[]);
forward LogCMD_CasaInatividade(strl[]);

forward LogCMD_ZerouGrana(strl[]);
forward LogCMD_ZerouBanco(strl[]);

forward LogCMD_AnuncioEmp(strl[]);
forward LogEquipar_P(playerid, strl[]);
forward LogDevarma_P(playerid, strl[]);

forward ArrombarLog(strl[]);
forward LogCMD_Dropar(strl[]);
forward LogCMD_Pegar(strl[]);
forward Colocar_PortaMalas(strl[]);
forward Retirar_PortaMalas(strl[]);

forward Colocar_PortaLuvas(strl[]);
forward Retirar_PortaLuvas(strl[]);
forward Cofres_Publicos(strl[]);
forward VehicleDeath(strl[]);
//==============================================================================
public VehicleDeath(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/OnVehicleDeath_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public Cofres_Publicos(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Cofres_Publicos_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public Retirar_PortaLuvas(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Retirar_PortaLuvas_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public Colocar_PortaLuvas(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Colocar_PortaLuvas_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public Retirar_PortaMalas(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Retirar_PortaMalas_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public Colocar_PortaMalas(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Colocar_PortaMalas_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_Pegar(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Pegar_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public ArrombarLog(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/arrombar/%s_%d_%d.log", mtext, month1, year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public LogDevarma_P(playerid, strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/devolver/%s_%s_%d.log", PlayerName(playerid, 0), mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public LogEquipar_P(playerid, strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/equipar/%s_%s_%d.log", PlayerName(playerid, 0), mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public RegLog(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Resgistro_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
//==============================================================================
public LogCMD_A(playerid, strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/admins/%s_%s_%d.log", PlayerName(playerid, 0), mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_AM(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/admins/AdminMensagem_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_FAC(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/FacMensagem_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_PAGAR(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Pagar_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
public LogCMD_venderdroga(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/npc/venderdrogas_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_ROJAO(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/rojao_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_Dropar(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Dropar_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_EntregarA(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[256],readfile[256];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/EntregarArma_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_Mascara(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Mascara_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_Anuncio(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Anuncio_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_barricada(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/roubos/barricada_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_b(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/b_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_me(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/me_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_do(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/do_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_Savings(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/Savings_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_sacar(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/sacar_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_deposito(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/depositar_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_transf(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/transferir_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_dargrana(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/dargrana_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_explodircaixa(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/roubos/explodircaixa_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_dararma(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/setararma/dararma_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_CasaInatividade(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/PerdeuCasa_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_ZerouGrana(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/AdmCmd/ZerouGrana_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_ZerouBanco(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/AdmCmd/ZerouBanco_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}

public LogCMD_AnuncioEmp(strl[])
{
    new mtext[20],year1, month1,day1,hour,minuite,second,entry[128],readfile[128];
	getdate(year1, month1, day1);
	switch(month1)
	{
		case 1: mtext = "Janeiro";
		case 2: mtext = "Fevereiro";
		case 3: mtext = "Março";
		case 4: mtext = "Abril";
		case 5: mtext = "Maio";
		case 6: mtext = "Junho";
		case 7: mtext = "Julho";
		case 8: mtext = "Agosto";
		case 9: mtext = "Setembro";
		case 10: mtext = "Outubro";
		case 11: mtext = "Novembro";
	    case 12: mtext = "Dezembro";
	}
	gettime(hour,minuite,second);
	format(entry, sizeof(entry), "[%d %s %d:%d:%d] %s\n",day1, mtext, hour, minuite, second, strl);
	format(readfile, sizeof(readfile), "logs/AnuncioEmp_%s_%d.log", mtext,year1);
	new File: hFile = fopen(readfile, io_append);
	if(!hFile) return 1; // Do not saved a corrupt file.
	fwrite(hFile, entry);
	fclose(hFile);
	return 1;
}
