from flask import * 
from database import*
import uuid

admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():
    
	return render_template('admin_home.html')

@admin.route('/admin_managecategory',methods=['post','get'])	
def admin_managecategory():
	data={}
	q="select * from category"
	res=select(q)
	data['categoryview']=res

	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']

	else:
		action=None

	if action=='active':
		q="update category set status='1' where category_id='%s'"%(cid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_managecategory'))
	if action=='inactive':
		q="update category set status='0' where category_id='%s'"%(cid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_managecategory'))

	if action=='update':
		q="select * from category where category_id='%s'"%(cid)
		res=select(q)
		data['categoryupdate']=res

	if "update" in request.form:
		f=request.form['fname']
		d=request.form['dis']
		q="update category set category_name='%s', category_description='%s' where category_id='%s'"%(f,d,cid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_managecategory'))

	if "category" in request.form:
		f=request.form['fname']
		d=request.form['dis']
		t="select * from category where category_name='%s'"%(f)
		val=select(t)
		if val:
			flash('already exist')
		else:
			q="insert into category values(null,'%s','%s','1')"%(f,d)
			insert(q)
			flash('successfully')
		return redirect(url_for('admin.admin_managecategory'))
		
	return render_template('admin_managecategory.html',data=data)


@admin.route('/admin_managevendor',methods=['post','get'])	
def admin_managevendor():
	data={}
	q="select * from vendor"
	res=select(q)
	session['res']=res
	data['vendorview']=res


	if "action" in request.args:
		action=request.args['action']
		vid=request.args['vid']

	else:
		action=None

	if action=='inactive':
		q="update vendor set vendor_status='0' where vendor_id='%s'"%(vid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_managevendor'))

	if action=='active':
		q="update vendor set vendor_status='1' where vendor_id='%s'"%(vid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_managevendor'))

	if action=='update':
		q="select * from vendor where vendor_id='%s'"%(vid)
		res=select(q)
		data['vendorupdate']=res

	if "up" in request.form:
		f=request.form['fname']
		n=request.form['hno']
		e=request.form['street']
		h=request.form['city']
		s=request.form['state']
		di=request.form['pin']
		p=request.form['num']
		d=request.form['email']
		
		q="update vendor set vendor_name='%s',vendor_building_name='%s',vendor_street='%s',vendor_city='%s',vendor_state='%s',vendor_pincode='%s',vendor_phone='%s',vendor_email='%s' where vendor_id='%s'"%(f,n,e,h,s,di,p,d,vid)
		update(q)
		flash('successfully')
		print(q)
		return redirect(url_for('admin.admin_managevendor'))
		
			

	if "vendor" in request.form:
	
		f=request.form['fname']
		n=request.form['hno']
		e=request.form['street']
		h=request.form['city']
		s=request.form['state']
		di=request.form['pin']
		p=request.form['num']
		d=request.form['email']
		u=request.form['uname']
		pa=request.form['pwd']
		t="select * from login where username='%s'"%(u)
		val=select(t)
		if val:
				flash('already exist')

		else:
			q="insert into login values('%s','%s','vendor','1')"%(u,pa)
			insert(q)
			q="insert into vendor values(null,'%s','0','%s','%s','%s','%s','%s','%s','%s','%s',curdate(),'1')"%(u,f,n,e,h,s,di,p,d)
			insert(q)
			flash('successfully')
		return redirect(url_for('admin.admin_managevendor'))
	return render_template('admin_managevendor.html',data=data)


@admin.route('/admin_viewcustomer')	
def admin_viewcustomer():
	data={}

	if "action" in request.args:
		action=request.args['action']
		lid=request.args['lid']

	else:
		action=None

	if action=='accept':
		q="update login set status='1' where username='%s'"%(lid)
		update(q)
		q="update customer set customer_status='1' where username='%s'"%(lid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewcustomer'))

	if action=='reject':
		q="update login set status='0' where username='%s'"%(lid)
		update(q)
		q="update customer set customer_status='0' where username='%s'"%(lid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewcustomer'))
			
	q="select * from customer inner join login using (username)"
	res=select(q)
	data['customerview']=res
	session['res']=res

	return render_template('admin_viewcustomer.html',data=data)



@admin.route('/admin_managepurchase',methods=['post','get'])	
def admin_managepurchase():
	data={}

	q="select * from vendor where vendor_status='1'"
	res=select(q)
	data['vendordrop']=res


	q="select * from product where product_status='1'"
	res=select(q)
	data['productdrop']=res



	q="SELECT * FROM `purchase_child` INNER JOIN `purchase_master` USING (`purchase_master_id`) INNER JOIN `vendor` USING (`vendor_id`) INNER JOIN `product` USING (`product_id`) where status='Accept'"
	res=select(q)
	data['purchaseview']=res


	if "action" in request.args:
		action=request.args['action']
		pid=request.args['pid']
	else:
		action=None

	if  action=='conform':
		q="select * from purchase_master inner join purchase_child using(purchase_master_id) where status='Accept'"
		res=select(q)
		if res:
			for i in res:
				item=i['product_id']
				S_price=i['selling_price']
				P_qty=i['quantity']
				Pur_id=i['purchase_child_id']
				
				q="select * from product where product_id='%s' and stock='0'"%(item)
				print(q)
				res1=select(q)
				if res1:
					q="update product set stock='%s',rate='%s' where  product_id='%s'"%(P_qty,S_price,item)
					update(q)
					q="update purchase_child set pc_status='stock added' where purchase_child_id='%s'"%(Pur_id)
					update(q)
					q="update purchase_master set status='paid' where purchase_master_id='%s'"%(res[0]['purchase_master_id'])
					update(q)
					q="select * from order_details where product_id='%s'"%(item)
					variable1=select(q)
					for j in variable1:
						cart_qty=j['quantity']
						q="update order_details set total_price='%s'+'%s' where product_id='%s'"%(S_price,cart_qty,item)
						update(q)
						# q="select sum(price) from tbl_cart_child inner join tbl_cart_master where Cust_id=''"
					# flash('Purchase Completed...')
				else:
					q="update purchase_master set status='paid' where purchase_master_id='%s'"%(res[0]['purchase_master_id'])
					update(q)
				# flash('Purchase Completed...')
		
		return redirect(url_for('admin.admin_managepurchase'))



	if "purchase" in request.form:
		ve=request.form['ven']
		p=request.form['pro']
	 
		
		qu=request.form['quantity']
		
		q="select * from product where product_id='%s'"%(p)
		c=select(q)[0]['rate']
		t=int(c)*int(qu)
		print(c)
		
		q="select * from purchase_master where vendor_id='%s' and status='pending'"%(ve)
		res=select(q)
		if res:
			pmid=res[0]['purchase_master_id']

		else:
			q="insert into purchase_master values(null,'%s','0','0','pending',curdate())"%(ve)
			pmid=insert(q)

		q="select * from purchase_child where product_id='%s' and cost_price='%s' and purchase_master_id='%s' "%(p,c,pmid)
		res=select(q)
		print(q)
		if res:
			pcid=res[0]['purchase_child_id']
			q="update purchase_child set quantity=quantity+'%s',cost_price=cost_price+'%s' where purchase_child_id='%s'"%(qu,c,pcid)
			update(q)
			print(q)

		else:		
			q="insert into purchase_child values(null,'%s','%s','%s','%s','%s','available')"%(pmid,p,c,c,qu)
			insert(q)
			print(q)

		q="update purchase_master set total=total+'%s' where purchase_master_id='%s'"%(t,pmid)
		update(q)
		flash('successfully')

		return redirect(url_for('admin.admin_managepurchase'))
	return render_template('admin_managepurchase.html',data=data)
