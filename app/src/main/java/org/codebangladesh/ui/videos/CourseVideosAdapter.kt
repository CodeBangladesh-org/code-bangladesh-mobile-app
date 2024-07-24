package org.codebangladesh.ui.videos

import android.annotation.SuppressLint
import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import org.codebangladesh.R
import org.codebangladesh.ui.dto.CourseResponseDto

class CourseVideosAdapter(
    private val course: CourseResponseDto
) :
    RecyclerView.Adapter<CourseVideosAdapter.ViewHolder>() {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val videoName: TextView = view.findViewById(R.id.videoNameTextView)
        val videoDesc: TextView = view.findViewById(R.id.videoDescTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.item_course_video, parent, false)
        return ViewHolder(view)
    }

    @SuppressLint("SetTextI18n")
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val content = course.content[position]
        holder.videoName.text = content.name
        holder.videoDesc.text = content.description

        holder.itemView.setOnClickListener {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse(content.videoLink)
            it.context.startActivity(intent)
        }
    }

    override fun getItemCount() = course.content.size
}