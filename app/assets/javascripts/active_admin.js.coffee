#= require active_admin/base
#= require rich/base

$ ->
    product_pic = document.getElementById('product_pic')
    return unless product_pic

    bindImageDrag = ->
        iframe = document.getElementsByClassName("cke_wysiwyg_frame")[0]
        return unless iframe

        imgs = iframe.contentDocument.getElementsByTagName("img")
        for img in imgs
            do (img) ->
                unless img.ondragstart
                    img.ondragstart = (e) -> 
                        e.dataTransfer.setData 'src', e.target.getAttribute('src') 

    product_pic.ondrop = (e) -> 
        e.target.value = e.dataTransfer.getData('src') 
 
    CKEDITOR.on 'instanceReady', (e) ->
        bindImageDrag()
        editor = e.editor
        e.editor.on 'change', bindImageDrag