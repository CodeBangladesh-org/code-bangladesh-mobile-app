package org.codebangladesh.ui.courses

import android.annotation.SuppressLint
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

class CoursesAdapter(
    private val category: CategoryResponseDto
) : RecyclerView.Adapter<CoursesAdapter.ViewHolder>() {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val courseName: TextView = view.findViewById(R.id.courseNameTextView)
        val courseDesc: TextView = view.findViewById(R.id.courseDescTextView)
        val numberOfVideosImageView: ImageView = view.findViewById(R.id.numberOfVideosImageView)
        val numberOfVideos: TextView = view.findViewById(R.id.numberOfVideosTextView)
        val topicsImageView: ImageView = view.findViewById(R.id.topicsIconImageView)
        val topics: TextView = view.findViewById(R.id.topicsTextView)
        val instructorsImageView: ImageView = view.findViewById(R.id.instructorsIconImageView)
        val instructors: TextView = view.findViewById(R.id.instructorsTextView)
        val complexityImageView: ImageView = view.findViewById(R.id.complexityIconImageView)
        val complexity: TextView = view.findViewById(R.id.complexityTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.item_course, parent, false)
        return ViewHolder(view)
    }

    @SuppressLint("SetTextI18n")
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val course = category.courses[position]
        holder.courseName.text = course.name
        holder.courseDesc.text = course.description

        Glide.with(holder.numberOfVideosImageView.context)
            .loadAssetImage(holder.numberOfVideosImageView.context.assets, "img/youtube.png")
            .into(holder.numberOfVideosImageView)
        holder.numberOfVideos.text = "${course.numberOfVideos} টি ভিডিও"

        Glide.with(holder.topicsImageView.context)
            .loadAssetImage(holder.topicsImageView.context.assets, "img/tag.png")
            .into(holder.topicsImageView)
        holder.topics.text = course.topics.joinToString()

        Glide.with(holder.instructorsImageView.context)
            .loadAssetImage(holder.instructorsImageView.context.assets, "img/instructor.png")
            .into(holder.instructorsImageView)
        holder.instructors.text =
            course.instructors.joinToString { instructorResponseDto -> instructorResponseDto.name }

        Glide.with(holder.complexityImageView.context)
            .loadAssetImage(holder.complexityImageView.context.assets, "img/complexity.png")
            .into(holder.complexityImageView)
        holder.complexity.text = course.complexity

        holder.itemView.setOnClickListener {
            val action = CoursesFragmentDirections.actionCoursesFragmentToCourseVideosFragment(
                category.name,
                course.name
            )
            it.findNavController().navigate(action)
        }
    }

    override fun getItemCount() = category.courses.size
}