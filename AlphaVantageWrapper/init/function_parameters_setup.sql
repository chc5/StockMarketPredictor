DROP TABLE IF EXISTS function_parameter CASCADE;
DROP TABLE IF EXISTS function;
DROP TABLE IF EXISTS parameter;
CREATE TABLE function{
  id serial PRIMARY KEY,
  name VARCHAR (50) UNIQUE NOT NULL
};

CREATE TABLE parameter{
  id serial PRIMARY KEY,
  name VARCHAR (50) UNIQUE NOT NULL,
  regexp_verifier VARCHAR (50) NOT NULL
};

CREATE TABLE function_parameter{
  id serial PRIMARY KEY,
  func_id VARCHAR (50) REFERENCES function(id),
  param_id VARCHAR (50) REFERENCES parameter(id),
  required BOOLEAN NOT NULL
};

INSERT INTO function (name)
VALUES
('APO'),
('AROON'),
('AROONOSC'),
('AD'),
('ADX'),
('ADXR'),
('ADOSC'),
('ATR'),
('BATCH_STOCK_QUOTES'),
('BBANDS'),
('BOP'),
('CCI'),
('CURRENCY_EXCHANGE_RATE'),
('CMO'),
('DEMA'),
('DX'),
('DIGITAL_CURRENCY_DAILY'),
('DIGITAL_CURRENCY_WEEKLY'),
('DIGITAL_CURRENCY_INTRADAY'),
('DIGITAL_CURRENCY_MONTHLY'),
('EMA'),
('HT_PHASOR'),
('HT_SINE'),
('HT_TRENDLINE'),
('HT_TRENDMODE'),
('HT_DCPERIOD'),
('HT_DCPHASE'),
('KAMA'),
('MACD'),
('MACDEXT'),
('MAMA'),
('MFI'),
('MIDPRICE'),
('MIDPOINT'),
('MINUS_DI'),
('MINUS_DM'),
('MOM'),
('NATR'),
('OBV'),
('PPO'),
('PLUS_DI'),
('PLUS_DM'),
('RSI'),
('ROC'),
('ROCR'),
('SAR'),
('STOCH'),
('STOCHRSI'),
('STOCHF'),
('SECTOR'),
('SMA'),
('TRANGE'),
('TRIX'),
('TRIMA'),
('T3'),
('TEMA'),
('TIME_SERIES_DAILY'),
('TIME_SERIES_DAILY_ADJUSTED'),
('TIME_SERIES_WEEKLY'),
('TIME_SERIES_WEEKLY_ADJUSTED'),
('TIME_SERIES_INTRADAY'),
('TIME_SERIES_MONTHLY'),
('TIME_SERIES_MONTHLY_ADJUSTED'),
('ULTOSC'),
('WILLR'),
('WMA')
;


INSERT INTO parameter (name, regexp_verifier)
VALUES
('function', '^[A-Z][A-Z_]*$'),
('symbols', '^[A-Z][A-Z,]*$'),
('symbol', '^[A-Z]+$'),
('interval', '((1|5|15|30|60)min|^daily$|^weekly$|^monthly$)'),
('outputsize', '(^compact$|^full$)'),
('datatype', '(^json$|^csv$)'),
('from_currency', '^[A-Z]+$'),
('to_currency', '^[A-Z]+$'),
('market', '^[A-Z]+$'),
('series_type', '(^close$|^open$|^high$|^low$)'),
('time_period', '^[1-9][0-9]*$'),
('fastlimit', '^[+]?([0-9]*[.])?[0-9]+'),
('slowlimit', '^[+]?([0-9]*[.])?[0-9]+'),
('fastperiod', '^[1-9][0-9]*$'),
('signalperiod', '^[1-9][0-9]*$'),
('slowperiod', '^[1-9][0-9]*$'),
('fastmatype', '^[0-8]$'),
('signalmatype', '^[0-8]$'),
('slowmatype', '^[0-8]$'),
('fastkperiod', '^[1-9][0-9]*$'),
('slowkperiod', '^[1-9][0-9]*$'),
('fastdmatype', '^[0-8]$'),
('slowdmatype', '^[0-8]$'),
('fastdperiod', '^[1-9][0-9]*$'),
('slowdperiod', '^[1-9][0-9]*$'),
('matype', '^[0-8]$'),
('slowkmatype', '^[0-8]$'),
('timeperiod1', '^[1-9][0-9]*$'),
('timeperiod2', '^[1-9][0-9]*$'),
('timeperiod3', '^[1-9][0-9]*$'),
('nbdevdn', '^[1-9][0-9]*$'),
('nbdevup', '^[1-9][0-9]*$'),
('acceleration', '^[+]?([0-9]*[.])?[0-9]+'),
('maximum', '^[+]?([0-9]*[.])?[0-9]+')
;

CREATE TABLE temp_funct_parameter{
  id serial PRIMARY KEY,
  func_name VARCHAR (50) NOT NULL,
  param_name VARCHAR (50) NOT NULL,
  required BOOLEAN NOT NULL
};

INSERT INTO temp_funct_parameter (func_name, param_name, required)
VALUES
('APO', 'function', True),
('APO', 'interval', True),
('APO', 'series_type', True),
('APO', 'symbol', True),
('APO', 'time_period', True),
('APO', 'fastperiod', False),
('APO', 'matype', False),
('APO', 'slowperiod', False),

('AROON', 'function', True),
('AROON', 'interval', True),
('AROON', 'symbol', True),
('AROON', 'time_period', True),

('AROONOSC', 'function', True),
('AROONOSC', 'interval', True),
('AROONOSC', 'symbol', True),
('AROONOSC', 'time_period', True),

('AD', 'function', True),
('AD', 'interval', True),
('AD', 'symbol', True),

('ADX', 'function', True),
('ADX', 'interval', True),
('ADX', 'symbol', True),
('ADX', 'time_period', True),

('ADXR', 'function', True),
('ADXR', 'interval', True),
('ADXR', 'symbol', True),
('ADXR', 'time_period', True),

('ADOSC', 'function', True),
('ADOSC', 'interval', True),
('ADOSC', 'symbol', True),
('ADOSC', 'fastperiod', False),
('ADOSC', 'slowperiod', False),

('ATR', 'function', True),
('ATR', 'interval', True),
('ATR', 'symbol', True),
('ATR', 'time_period', True),

('BATCH_STOCK_QUOTES', 'function', True),
('BATCH_STOCK_QUOTES', 'symbols', True),
('BATCH_STOCK_QUOTES', 'datatype', False),

('BBANDS', 'function', True),
('BBANDS', 'interval', True),
('BBANDS', 'series_type', True),
('BBANDS', 'symbol', True),
('BBANDS', 'time_period', True),
('BBANDS', 'matype', False),
('BBANDS', 'nbdevdn', False),
('BBANDS', 'nbdevup', False),

('BOP', 'function', True),
('BOP', 'interval', True),
('BOP', 'symbol', True),

('CCI', 'function', True),
('CCI', 'interval', True),
('CCI', 'symbol', True),
('CCI', 'time_period', True),

('CURRENCY_EXCHANGE_RATE', 'from_currency', True),
('CURRENCY_EXCHANGE_RATE', 'function', True),
('CURRENCY_EXCHANGE_RATE', 'to_currency', True),

('CMO', 'function', True),
('CMO', 'interval', True),
('CMO', 'series_type', True),
('CMO', 'symbol', True),
('CMO', 'time_period', True),

('DEMA', 'function', True),
('DEMA', 'interval', True),
('DEMA', 'series_type', True),
('DEMA', 'symbol', True),
('DEMA', 'time_period', True),

('DX', 'function', True),
('DX', 'interval', True),
('DX', 'symbol', True),
('DX', 'time_period', True),

('DIGITAL_CURRENCY_DAILY', 'function', True),
('DIGITAL_CURRENCY_DAILY', 'market', True),
('DIGITAL_CURRENCY_DAILY', 'symbol', True),

('DIGITAL_CURRENCY_WEEKLY', 'function', True),
('DIGITAL_CURRENCY_WEEKLY', 'market', True),
('DIGITAL_CURRENCY_WEEKLY', 'symbol', True),

('DIGITAL_CURRENCY_INTRADAY', 'function', True),
('DIGITAL_CURRENCY_INTRADAY', 'market', True),
('DIGITAL_CURRENCY_INTRADAY', 'symbol', True),

('DIGITAL_CURRENCY_MONTHLY', 'function', True),
('DIGITAL_CURRENCY_MONTHLY', 'market', True),
('DIGITAL_CURRENCY_MONTHLY', 'symbol', True),

('EMA', 'function', True),
('EMA', 'interval', True),
('EMA', 'series_type', True),
('EMA', 'symbol', True),
('EMA', 'time_period', True),

('HT_PHASOR', 'function', True),
('HT_PHASOR', 'interval', True),
('HT_PHASOR', 'series_type', True),
('HT_PHASOR', 'symbol', True),

('HT_SINE', 'function', True),
('HT_SINE', 'interval', True),
('HT_SINE', 'series_type', True),
('HT_SINE', 'symbol', True),

('HT_TRENDLINE', 'function', True),
('HT_TRENDLINE', 'interval', True),
('HT_TRENDLINE', 'series_type', True),
('HT_TRENDLINE', 'symbol', True),

('HT_TRENDMODE', 'function', True),
('HT_TRENDMODE', 'interval', True),
('HT_TRENDMODE', 'series_type', True),
('HT_TRENDMODE', 'symbol', True),

('HT_DCPERIOD', 'function', True),
('HT_DCPERIOD', 'interval', True),
('HT_DCPERIOD', 'series_type', True),
('HT_DCPERIOD', 'symbol', True),

('HT_DCPHASE', 'function', True),
('HT_DCPHASE', 'interval', True),
('HT_DCPHASE', 'series_type', True),
('HT_DCPHASE', 'symbol', True),

('KAMA', 'function', True),
('KAMA', 'interval', True),
('KAMA', 'series_type', True),
('KAMA', 'symbol', True),
('KAMA', 'time_period', True),

('MACD', 'function', True),
('MACD', 'interval', True),
('MACD', 'series_type', True),
('MACD', 'symbol', True),
('MACD', 'fastperiod', False),
('MACD', 'signalperiod', False),
('MACD', 'slowperiod', False),

('MACDEXT', 'function', True),
('MACDEXT', 'interval', True),
('MACDEXT', 'series_type', True),
('MACDEXT', 'symbol', True),
('MACDEXT', 'fastmatype', False),
('MACDEXT', 'fastperiod', False),
('MACDEXT', 'signalmatype', False),
('MACDEXT', 'signalperiod', False),
('MACDEXT', 'slowmatype', False),
('MACDEXT', 'slowperiod', False),

('MAMA', 'function', True),
('MAMA', 'interval', True),
('MAMA', 'series_type', True),
('MAMA', 'symbol', True),
('MAMA', 'fastlimit', False),
('MAMA', 'slowlimit', False),

('MFI', 'function', True),
('MFI', 'interval', True),
('MFI', 'symbol', True),
('MFI', 'time_period', True),

('MIDPRICE', 'function', True),
('MIDPRICE', 'interval', True),
('MIDPRICE', 'symbol', True),
('MIDPRICE', 'time_period', True),

('MIDPOINT', 'function', True),
('MIDPOINT', 'interval', True),
('MIDPOINT', 'series_type', True),
('MIDPOINT', 'symbol', True),
('MIDPOINT', 'time_period', True),

('MINUS_DI', 'function', True),
('MINUS_DI', 'interval', True),
('MINUS_DI', 'symbol', True),
('MINUS_DI', 'time_period', True),

('MINUS_DM', 'function', True),
('MINUS_DM', 'interval', True),
('MINUS_DM', 'symbol', True),
('MINUS_DM', 'time_period', True),

('MOM', 'function', True),
('MOM', 'interval', True),
('MOM', 'series_type', True),
('MOM', 'symbol', True),
('MOM', 'time_period', True),

('NATR', 'function', True),
('NATR', 'interval', True),
('NATR', 'symbol', True),
('NATR', 'time_period', True),

('OBV', 'function', True),
('OBV', 'interval', True),
('OBV', 'symbol', True),

('PPO', 'function', True),
('PPO', 'interval', True),
('PPO', 'series_type', True),
('PPO', 'symbol', True),
('PPO', 'time_period', True),
('PPO', 'fastperiod', False),
('PPO', 'matype', False),
('PPO', 'slowperiod', False),

('PLUS_DI', 'function', True),
('PLUS_DI', 'interval', True),
('PLUS_DI', 'symbol', True),
('PLUS_DI', 'time_period', True),

('PLUS_DM', 'function', True),
('PLUS_DM', 'interval', True),
('PLUS_DM', 'symbol', True),
('PLUS_DM', 'time_period', True),

('RSI', 'function', True),
('RSI', 'interval', True),
('RSI', 'series_type', True),
('RSI', 'symbol', True),
('RSI', 'time_period', True),

('ROC', 'function', True),
('ROC', 'interval', True),
('ROC', 'series_type', True),
('ROC', 'symbol', True),
('ROC', 'time_period', True),

('ROCR', 'function', True),
('ROCR', 'interval', True),
('ROCR', 'series_type', True),
('ROCR', 'symbol', True),
('ROCR', 'time_period', True),

('SAR', 'function', True),
('SAR', 'interval', True),
('SAR', 'symbol', True),
('SAR', 'acceleration', False),
('SAR', 'maximum', False),

('STOCH', 'function', True),
('STOCH', 'interval', True),
('STOCH', 'symbol', True),
('STOCH', 'fastkperiod', False),
('STOCH', 'slowdmatype', False),
('STOCH', 'slowdperiod', False),
('STOCH', 'slowkmatype', False),
('STOCH', 'slowkperiod', False),

('STOCHRSI', 'function', True),
('STOCHRSI', 'interval', True),
('STOCHRSI', 'series_type', True),
('STOCHRSI', 'symbol', True),
('STOCHRSI', 'time_period', True),
('STOCHRSI', 'fastdmatype', False),
('STOCHRSI', 'fastdperiod', False),
('STOCHRSI', 'fastkperiod', False),

('STOCHF', 'function', True),
('STOCHF', 'interval', True),
('STOCHF', 'symbol', True),
('STOCHF', 'fastkperiod', False),
('STOCHF', 'slowdmatype', False),
('STOCHF', 'slowdperiod', False),
('STOCHF', 'slowkmatype', False),
('STOCHF', 'slowkperiod', False),

('SECTOR', 'function', True),

('SMA', 'function', True),
('SMA', 'interval', True),
('SMA', 'series_type', True),
('SMA', 'symbol', True),
('SMA', 'time_period', True),

('TRANGE', 'function', True),
('TRANGE', 'interval', True),
('TRANGE', 'symbol', True),

('TRIX', 'function', True),
('TRIX', 'interval', True),
('TRIX', 'series_type', True),
('TRIX', 'symbol', True),
('TRIX', 'time_period', True),

('TRIMA', 'function', True),
('TRIMA', 'interval', True),
('TRIMA', 'series_type', True),
('TRIMA', 'symbol', True),
('TRIMA', 'time_period', True),

('T3', 'function', True),
('T3', 'interval', True),
('T3', 'series_type', True),
('T3', 'symbol', True),
('T3', 'time_period', True),

('TEMA', 'function', True),
('TEMA', 'interval', True),
('TEMA', 'series_type', True),
('TEMA', 'symbol', True),
('TEMA', 'time_period', True),

('TIME_SERIES_DAILY', 'function', True),
('TIME_SERIES_DAILY', 'symbol', True),
('TIME_SERIES_DAILY', 'datatype', False),
('TIME_SERIES_DAILY', 'outputsize', False),

('TIME_SERIES_DAILY_ADJUSTED', 'function', True),
('TIME_SERIES_DAILY_ADJUSTED', 'symbol', True),
('TIME_SERIES_DAILY_ADJUSTED', 'datatype', False),
('TIME_SERIES_DAILY_ADJUSTED', 'outputsize', False),

('TIME_SERIES_WEEKLY', 'function', True),
('TIME_SERIES_WEEKLY', 'symbol', True),
('TIME_SERIES_WEEKLY', 'datatype', False),

('TIME_SERIES_WEEKLY_ADJUSTED', 'function', True),
('TIME_SERIES_WEEKLY_ADJUSTED', 'symbol', True),
('TIME_SERIES_WEEKLY_ADJUSTED', 'datatype', False),

('TIME_SERIES_INTRADAY', 'function', True),
('TIME_SERIES_INTRADAY', 'interval', True),
('TIME_SERIES_INTRADAY', 'symbol', True),
('TIME_SERIES_INTRADAY', 'datatype', False),
('TIME_SERIES_INTRADAY', 'outputsize', False),

('TIME_SERIES_MONTHLY', 'function', True),
('TIME_SERIES_MONTHLY', 'symbol', True),
('TIME_SERIES_MONTHLY', 'datatype', False),

('TIME_SERIES_MONTHLY_ADJUSTED', 'function', True),
('TIME_SERIES_MONTHLY_ADJUSTED', 'symbol', True),
('TIME_SERIES_MONTHLY_ADJUSTED', 'datatype', False),

('ULTOSC', 'function', True),
('ULTOSC', 'interval', True),
('ULTOSC', 'symbol', True),
('ULTOSC', 'timeperiod1', False),
('ULTOSC', 'timeperiod2', False),
('ULTOSC', 'timeperiod3', False),

('WILLR', 'function', True),
('WILLR', 'interval', True),
('WILLR', 'symbol', True),
('WILLR', 'time_period', True),

('WMA', 'function', True),
('WMA', 'interval', True),
('WMA', 'series_type', True),
('WMA', 'symbol', True),
('WMA', 'time_period', True)
;

INSERT INTO function_parameter (func_id, param_id, required)
VALUES
SELECT
    f.name func_id,
    p.name param_id,
    t.required required
FROM temp_funct_parameter t
INNER JOIN function f ON t.func_name = f.name
INNER JOIN parameter p ON t.param_name = p.name
;

DROP TABLE temp_funct_parameter;

-- CREATE INDEX name_index ON function USING HASH (name);
-- CREATE INDEX name_index ON parameter USING HASH (name);
