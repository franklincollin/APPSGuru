#include "../header_files/httpraction.h"

HTTPRAction::HTTPRAction(QObject *parent) : QObject(parent)
{

}

void HTTPRAction::httpUrl(QUrl url){
    this->urlForUse = url;
}

void HTTPRAction::httpParam(QString param){
    this->params = param;
}

void HTTPRAction::httpParam(QString param0, QString param1){
    this->params0 = param0;
    this->params1 = param1;
}

void HTTPRAction::httpParam(QString param0, QString param1, QString param2){
    this->params0 = param0;
    this->params1 = param1;
    this->params2 = param2;
}

void HTTPRAction::httpParam(QString param0, QString param1, QString param2, QString param3){
    this->params0 = param0;
    this->params1 = param1;
    this->params2 = param2;
    this->params3 = param3;
}

void HTTPRAction::httpParam(QString param0, QString param1, QString param2, QString param3, QString param4){
    this->params0 = param0;
    this->params1 = param1;
    this->params2 = param2;
    this->params3 = param3;
    this->params4 = param4;
}

void HTTPRAction::httpParam(QString param0, QString param1, QString param2, QString param3, QString param4, QString param5){
    this->params0 = param0;
    this->params1 = param1;
    this->params2 = param2;
    this->params3 = param3;
    this->params4 = param4;
    this->params5 = param5;
}

void HTTPRAction::httpValue(QString value){
    this->values = value;
}

void HTTPRAction::httpValue(QString value0, QString value1){
    this->values0 = value0;
    this->values1 = value1;
}

void HTTPRAction::httpValue(QString value0, QString value1, QString value2){
    this->values0 = value0;
    this->values1 = value1;
    this->values2 = value2;
}

void HTTPRAction::httpValue(QString value0, QString value1, QString value2, QString value3){
    this->values0 = value0;
    this->values1 = value1;
    this->values2 = value2;
    this->values3 = value3;
}

void HTTPRAction::httpValue(QString value0, QString value1, QString value2, QString value3, QString value4){
    this->values0 = value0;
    this->values1 = value1;
    this->values2 = value2;
    this->values3 = value3;
    this->values4 = value4;
}

void HTTPRAction::httpValue(QString value0, QString value1, QString value2, QString value3, QString value4, QString value5){
    this->values0 = value0;
    this->values1 = value1;
    this->values2 = value2;
    this->values3 = value3;
    this->values4 = value4;
    this->values5 = value5;
}

void HTTPRAction::httpExec(){
    QNetworkRequest request(this->urlForUse);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");

    QUrlQuery query;

    if(this->params.length() > 0){
        if(this->values.length() > 0){
            query.addQueryItem(this->params, this->values);
        }
    }
    if(this->params0.length() > 0 && this->params1.length() > 0) {
        if(this->values0.length() > 0 && this->values1.length() > 0){
            query.addQueryItem(this->params0, this->values0);
            query.addQueryItem(this->params1, this->values1);
        }
    }
    if(this->params0.length() > 0 && this->params1.length() > 0 && this->params2.length() > 0) {
        if(this->values0.length() > 0 && this->values1.length() > 0 && this->values2.length() > 0){
            query.addQueryItem(this->params0, this->values0);
            query.addQueryItem(this->params1, this->values1);
            query.addQueryItem(this->params2, this->values2);
        }
    }
    if(this->params0.length() > 0 && this->params1.length() > 0 && this->params2.length() > 0 && this->params3.length() > 0) {
        if(this->values0.length() > 0 && this->values1.length() > 0 && this->values2.length() > 0 && this->values3.length() > 0){
            query.addQueryItem(this->params0, this->values0);
            query.addQueryItem(this->params1, this->values1);
            query.addQueryItem(this->params2, this->values2);
            query.addQueryItem(this->params3, this->values3);
        }
    }
    if(this->params0.length() > 0 && this->params1.length() > 0 && this->params2.length() > 0 && this->params3.length() > 0
            && this->params4.length() > 0) {
        if(this->values0.length() > 0 && this->values1.length() > 0 && this->values2.length() > 0 && this->values3.length() > 0
           && this->values4.length() > 0) {
            query.addQueryItem(this->params0, this->values0);
            query.addQueryItem(this->params1, this->values1);
            query.addQueryItem(this->params2, this->values2);
            query.addQueryItem(this->params3, this->values3);
            query.addQueryItem(this->params4, this->values4);
        }
    }
    if(this->params0.length() > 0 && this->params1.length() > 0 && this->params2.length() > 0 && this->params3.length() > 0
            && this->params4.length() > 0 && this->params5.length() > 0){
        if(this->values0.length() > 0 && this->values1.length() > 0 && this->values2.length() > 0 && this->values3.length() > 0
                && this->values4.length() > 0 && this->values5.length() > 0){
            query.addQueryItem(this->params0, this->values0);
            query.addQueryItem(this->params1, this->values1);
            query.addQueryItem(this->params2, this->values2);
            query.addQueryItem(this->params3, this->values3);
            query.addQueryItem(this->params4, this->values4);
            query.addQueryItem(this->params5, this->values5);
        }
    }

    QUrl post_data;
    post_data.setQuery(query);

    QNetworkAccessManager network_manager;
    auto network_reply = network_manager.post(request, query.query().toUtf8());

    QEventLoop loop;
    connect(network_reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    QByteArray raw_data;

    if(network_reply->error() == QNetworkReply::NoError) {
        raw_data = network_reply->readAll();
        QString test = QTextCodec::codecForHtml(raw_data)->toUnicode(raw_data);

        this->NetworkError = false;
        this->httpResult = test;
        this->httpVariantResponse = raw_data;
    }
    else {
        qDebug()<<network_reply->errorString();
        this->NetworkError = true;
        qDebug() << QTextCodec::codecForHtml(raw_data)->toUnicode(raw_data);
    }
}

QString HTTPRAction::httpStringResponse(){
    return this->httpResult;
}

QByteArray HTTPRAction::httpRawResponse(){
    return this->httpVariantResponse;
}

