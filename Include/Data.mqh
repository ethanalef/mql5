//+------------------------------------------------------------------+
//|                                           Alef/Includes/Data.mqh |
//|                                        Copyright 2023, EthanAlef |
//|                                https://github.com/ethanalef/mql5 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, EthanAlef"
#property link      "https://github.com/ethanalef/mql5"
#property version   "1.00"

//+------------------------------------------------------------------+
//| A class for getting financial data of a symbol                   |
//+------------------------------------------------------------------+

//--- Declaration
class Data
{
    public:
        // default constructor
        Data();
        // default destructor
        ~Data();

        // get bid
        double GetBid(string symbol);
        double GetBid();
        // get ask
        double GetAsk(string symbol);
        double GetAsk();

        // get rates: time, open, close, high, low, tick_volume, spread, real_volume
        int GetRates(MqlRates &rates[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetRates(MqlRates &rates[], int count);
        // get open
        int GetOpen(double &open[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetOpen(double &open[], int count);
        // get close
        int GetClose(double &close[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetClose(double &close[], int count);
        // get high
        int GetHigh(double &high[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetHigh(double &high[], int count);
        // get low
        int GetLow(double &low[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetLow(double &low[], int count);
        // get time
        int GetTime(datetime &time[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetTime(datetime &time[], int count);
        // get tick_volume
        int GetTickVolume(long &tickVolume[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetTickVolume(long &tickVolume[], int count);
        // get real_volume
        int GetRealVolume(long &realVolume[], int count, string symbol, ENUM_TIMEFRAMES tf);
        int GetRealVolume(long &realVolume[], int count);

        // get ticks: time, bid, ask, last, volume, time_msc, flags, volume_real
        int GetTicks(MqlTick &ticks[], int count, string symbol);
        int GetTicks(MqlTick &ticks[], int count);

        // get market depth: type, price, volume, volume_real
        int GetMarketBook(MqlBookInfo &book[], string symbol);
        int GetMarketBook(MqlBookInfo &book[]);
};

//--- Implementation

// default constructor
Data::Data()
{
}
// default destructor
Data::~Data()
{
}

// get bid
double Data::GetBid(string symbol)
{
   return SymbolInfoDouble(symbol, SYMBOL_BID);
}

// get ask
double Data::GetAsk(string symbol)
{
   return SymbolInfoDouble(symbol, SYMBOL_ASK);
}

// get rates: time, open, close, high, low, tick_volume, spread, real_volume
int Data::GetRates(MqlRates &rates[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(rates, true);
   return CopyRates(symbol, tf, 0, count, rates);
}

int Data::GetRates(MqlRates &rates[], int count)
{
   return GetRates(rates, count, Symbol(), 0);
}

// get open
int Data::GetOpen(double &open[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(open, true);
   return CopyOpen(symbol, tf, 0, count, open);
}

int Data::GetOpen(double &open[], int count)
{
   return GetOpen(open, count, Symbol(), 0);
}

// get close
int Data::GetClose(double &close[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(close, true);
   return CopyClose(symbol, tf, 0, count, close);
}

int Data::GetClose(double &close[], int count)
{
   return GetClose(close, count, Symbol(), 0);
}

// get high
int Data::GetHigh(double &high[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(high, true);
   return CopyHigh(symbol, tf, 0, count, high);
}

int Data::GetHigh(double &high[], int count)
{
   return GetHigh(high, count, Symbol(), 0);
}

// get low
int Data::GetLow(double &low[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(low, true);
   return CopyLow(symbol, tf, 0, count, low);
}

int Data::GetLow(double &low[], int count)
{
   return GetLow(low, count, Symbol(), 0);
}

// get time
int Data::GetTime(datetime &time[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(time, true);
   return CopyTime(symbol, tf, 0, count, time);
}

int Data::GetTime(datetime &time[], int count)
{
   return GetTime(time, count, Symbol(), 0);
}

// get tick_volume
int Data::GetTickVolume(long &tickVolume[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
    ArraySetAsSeries(tickVolume, true);
    return CopyTickVolume(symbol, tf, 0, count, tickVolume);
}

int Data::GetTickVolume(long &tickVolume[], int count)
{
    return GetTickVolume(tickVolume, count, Symbol(), 0);
}

// get real_volume
int Data::GetRealVolume(long &realVolume[], int count, string symbol, ENUM_TIMEFRAMES tf)
{
    ArraySetAsSeries(realVolume, true);
    return CopyRealVolume(symbol, tf, 0, count, realVolume);
}

int Data::GetRealVolume(long &realVolume[], int count) {
    return GetRealVolume(realVolume, count, Symbol(), 0);
}

// get ticks: time, bid, ask, last, volume, time_msc, flags, volume_real
int Data::GetTicks(MqlTick &ticks[], int count, string symbol)
{
    ArraySetAsSeries(ticks, true);
    return CopyTicks(symbol, ticks, COPY_TICKS_ALL, 0, count);
}

int Data::GetTicks(MqlTick &ticks[], int count)
{
    return GetTicks(ticks, count, Symbol());
}

// get market depth: type, price, volume, volume_real
int Data::GetMarketBook(MqlBookInfo &book[], string symbol)
{
    MarketBookGet(symbol, book);
    return ArraySize(book);
}

int Data::GetMarketBook(MqlBookInfo &book[])
{
    return GetMarketBook(book, Symbol());
}

//+------------------------------------------------------------------+