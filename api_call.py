import cookielib, urllib, urllib2

jar = cookielib.CookieJar()

baseurl = 'https://hq-wfc2wiredforchange.com/api'

username = 'dago@codeforprogress.org'
password = 'codeforprogress'

authentication = {'email': username,
                  'password': password }

fields = {'object': 'supporter',
          'groupBy': 'Date_Created'}

base_handle = urllib2.build_opener(urllib2.HTTPCookieProcessor(jar))

apihandle = base_handle.open(baseurl + '/authenticate.sjs',urllib.urlencode(authentication))
apihandle = base_handle.open(baseurl + '/getCounts.sjs',urllib.urlencode(fields))

source = apihandle.read()
apihandle.close()

print source


