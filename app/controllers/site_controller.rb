# encoding: utf-8
class SiteController < InheritedResources::Base
    def index
        @products = Product.where(:show_in_home => true).order(id: :desc)
    end

    def equipment
        @equipments = Equipment.all.order(id: :desc)
    end

    def news
        @news = News.all.order(pubdate: :desc)
    end

    def news_body
        @news = News.find(params[:id])
    end

    def news_category
        @news = NewsCategory.find(params[:id]).news.order(id: :desc)
        render :news
    end

    def products
        @products = Product.all.order(id: :desc)
    end

    def product_body
        @product = Product.find(params[:id])
    end

    def product_category
        @products = ProdCategory.find(params[:id]).products.order(id: :desc)
        render :products
    end

    def jobs
        @jobs = Job.where("expired_date > ?", DateTime.now).order(id: :desc)
    end

    def job_body
        @job = Job.find(params[:id])
    end

    def send_feedback
        company = params[:company]
        address = params[:address]
        visitor = params[:username]
        tel = params[:tel]
        fax = params[:fax]
        productName = params[:product]
        desc = params[:product_desc]
        advice = params[:advice]
        subject = "jingshunfood.com在线反馈：来自#{company}的#{visitor}留言"
        from = params[:email]
        to = label("在线反馈接收邮箱")
        mail_content = <<EOF
访客：#{visitor}
======================
公司名：  #{company}
公司地址：#{address}
电话：    #{tel}
传真：    #{fax}

=======================
关注产品：#{productName}
详细说明：#{desc}

========================
其他意见：#{advice} 
EOF

        msg = <<END_OF_MESSAGE
From: #{visitor} <#{from}>
To: <#{to}>
Subject: #{subject}

#{mail_content}
END_OF_MESSAGE

        begin
            _send_email(msg, from, to)
            flash[:message] = "您的反馈已经发送成功，感谢您的关注!"
            render :feedback
        rescue Exception => error  
            puts error
            flash[:message] = "反馈发送失败！"
            render :feedback
        end
    end


    private 
    def _send_email(msg, from, to)
        require "net/smtp"
        to = if to.nil?
        server = label("SMTP服务器")
        smtp = Net::SMTP.start(
            server, 
            label("SMTP端口").to_i, 
            server, 
            label("发送邮件账号"), 
            label("发送邮件密码"))
        smtp.send_message msg, from, to
        smtp.finish
    end

    def label(name)
        lb = Label.where(name: name).first
        if lb
            content
        else
            ""
        end
    end
end
end