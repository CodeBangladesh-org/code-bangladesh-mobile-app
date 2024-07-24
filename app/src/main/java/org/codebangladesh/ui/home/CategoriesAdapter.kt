package org.codebangladesh.ui.home

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.navigation.findNavController
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import org.codebangladesh.R
import org.codebangladesh.extensions.loadAssetImage
import org.codebangladesh.ui.dto.CategoryResponseDto

class CategoriesAdapter(private val categories: List<CategoryResponseDto>) :
    RecyclerView.Adapter<CategoriesAdapter.ViewHolder>() {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val categoryName: TextView = view.findViewById(R.id.categoryName)
        val categoryIcon: ImageView = view.findViewById(R.id.categoryIcon)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.item_category, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val category = categories[position]
        holder.categoryName.text = category.name

        val context = holder.categoryIcon.context
        Glide.with(context)
            .loadAssetImage(context.assets, category.imageSource)
            .into(holder.categoryIcon)

        holder.itemView.setOnClickListener {
            val action = HomeFragmentDirections.actionHomeFragmentToCoursesFragment(category.name)
            it.findNavController().navigate(action)
        }
    }

    override fun getItemCount() = categories.size
}