package org.codebangladesh.extensions

import android.content.res.AssetManager
import android.graphics.drawable.Drawable
import com.bumptech.glide.RequestBuilder
import com.bumptech.glide.RequestManager
import java.io.IOException

fun RequestManager.loadAssetImage(
    assetManager: AssetManager,
    resourcePath: String
): RequestBuilder<Drawable> {
    val prefix = "/assets/"
    val imagePath = if (resourcePath.startsWith(prefix)) {
        resourcePath.substring(prefix.length)
    } else {
        resourcePath
    }

    return try {
        assetManager.open(imagePath).use { inputStream ->
            val drawable: Drawable = Drawable.createFromStream(inputStream, null)!!
            asDrawable().load(drawable)
        }
    } catch (e: IOException) {
        throw RuntimeException("Failed to load asset image: $imagePath", e)
    }
}