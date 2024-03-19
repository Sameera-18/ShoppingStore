from flask import *
from database import*


public=Blueprint('public',__name__)

@public.route('/')
def public_home():

	return render_template('public_home.html')

@public.route('/public_login',methods=['post','get'])
def public_login():
	if "login" in request.form:
		u=request.form['uname']
		p=request.form['pwd']
		q="select * from login where username='%s' and password='%s'"%(u,p)
		res=select(q)
		if res:
			session['username']=res[0]['username']
			lid=session['username']

			if res[0]['user_type']=="admin":
				return redirect(url_for('admin.admin_home'))
			elif res[0]['user_type']=="customer":
				q="select * from customer inner join login using (username) where username='%s' and status='0'"%(u)
				res=select(q)
				if res:
					flash('inactive')
				else:


					q="select * from customer where username='%s'"%(lid)
					res=select(q)
					if res:
						session['customer_id']=res[0]['customer_id']
						cid=session['customer_id']
						session['customer_fname']=res[0]['customer_fname']
						customer_fname=session['customer_fname']
					return redirect(url_for('customer.customer_home'))


			elif res[0]['user_type']=="vendor":
				q="select * from vendor inner join login using (username) where username='%s' and status='0'"%(u)
				res=select(q)
				if res:
					flash('inactive')
				else:
					q="select * from vendor where username='%s'"%(lid)
					res=select(q)
					if res:
						session['vendor_id']=res[0]['vendor_id']
						vid=session['vendor_id']
					return redirect(url_for('vendor.vendorhome'))




		else:
			flash('invalid username and password')
					
	
					

		
	return render_template('public_login.html')

@public.route('/customer_registration',methods=['post','get'])	
def customer_registration():
	if "Submit" in request.form:
		f=request.form['fname']
		l=request.form['lname']
		h=request.form['hno']
		s=request.form['street']
		di=request.form['city']
		st=request.form['state']
		pi=request.form['pin']
		n=request.form['num']
		e=request.form['email']
	
		u=request.form['uname']
		pa=request.form['pwd']
		rp=request.form['rpwd']
		
		if(pa!=rp):

			flash('The passwords not matching')

		else:

			q="select * from login where username='%s' and password='%s'"%(u,pa)
			res=select(q)
			if res:

				flash('already exist')

			else:
			
				q="insert into login values('%s','%s','customer','1')"%(u,pa)
				insert(q)
				q="insert into customer values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','1')"%(u,f,l,h,s,di,st,pi,n,e)
				insert(q)
				print(q)
				flash('successfully registered please login')
				return redirect(url_for('public.public_login'))

	return render_template('customer_registration.html')