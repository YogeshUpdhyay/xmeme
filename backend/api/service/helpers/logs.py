import logging
formatter = logging.Formatter('%(asctime)s,%(msecs)d %(levelname)-8s [%(filename)s:%(lineno)d] %(message)s')


def setup_logger(name, log_file=None, level=logging.DEBUG):
    """To setup as many loggers as you want"""
    if log_file:
        handler = logging.FileHandler(log_file)
        handler.setFormatter(formatter)
    else:
        handler = logging.StreamHandler()
        handler.setFormatter(formatter)
    logger = logging.getLogger(name)
    logger.setLevel(level)
    logger.addHandler(handler)

    return logger


console_logger = setup_logger("console_logger")

# first file logger
# logger = setup_logger('first_logger', 'logs.log')
# logger.debug('This is just info message')
# 
# # second file logger
# super_logger = setup_logger('second_logger')
# super_logger.debug('This is an error message')
# 
# # def another_method():
#    # using logger defined above also works here
# logger.info('Inside method')