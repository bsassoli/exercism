import datetime
def add(moment):
    moment = moment + datetime.timedelta(seconds=10 ** 9)
    return moment
